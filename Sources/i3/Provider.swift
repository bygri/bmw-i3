import Foundation
import Jobs
import LeafProvider
import Vapor

public final class Provider: Vapor.Provider {

  public static let repositoryName = "i3"

  public convenience init(config: Config) throws {
    self.init()
  }

  init() {}

  public func boot(_ config: Config) throws {
    Migrations.add(to: config)
    config.addConfigurable(command: Fetch.init, name: "fetch")
    config.addConfigurable(command: Parse.init, name: "parse")
    config.addConfigurable(command: State.init, name: "state")
  }

  public func boot(_ drop: Droplet) throws {
    RawRecord.database = drop.database
    RawRecordError.database = drop.database
    Record.database = drop.database
    VehicleState.database = drop.database
    guard let cfg = drop.config["connecteddrive"] else {
      throw ConfigError.missingFile("connecteddrive")
    }
    guard let timezoneName = cfg["timezone"]?.string else {
      throw ConfigError.missing(key: ["timezone"], file: "connecteddrive", desiredType: String.self)
    }
    guard let timezone = TimeZone(identifier: timezoneName) else {
      drop.log.error("Bad timezone \(timezoneName) provided.")
      fatalError()
    }
    let routes = Routes(drop.view, timezone)
    try drop.collection(routes)
  }

  public func beforeRun(_ drop: Droplet) throws {
    // If we are running `serve`, then start running background jobs.
    let args = drop.config.arguments.dropFirst()
    guard args.count == 0 || args.first == "serve" else {
      return
    }
    let df = DateFormatter()
    df.dateStyle = .short
    df.timeStyle = .short
    df.timeZone = TimeZone(identifier: "Australia/Sydney")
    Jobs.add(
      interval: .seconds(5*60),
      action: {
        // Run a Fetch, and then a Parse.
        drop.log.info("JOB: Beginning job.")
        try Fetch(
          config: drop.config,
          cache: drop.cache,
          client: drop.client,
          console: drop.console,
          log: drop.log
        ).run(arguments: [])
        try Parse(
          console: drop.console,
          log: drop.log
        ).run(arguments: [])
        try State(
          console: drop.console,
          log: drop.log
        ).run(arguments: [])
        drop.log.info("JOB: Job completed successfully at \(df.string(from: Date())). Next one in 5 minutes.")
      },
      onError: { error in
        drop.log.error(String(describing: error))
        drop.log.info("JOB: Error in job at \(df.string(from: Date())); retrying in 5 minutes. ")
        return .retry(after: .seconds(5*60))
      }
    )
  }

}
