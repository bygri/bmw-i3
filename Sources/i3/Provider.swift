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
    config.preparations.append(RawRecord.RawRecordMigration1.self)
    config.preparations.append(Record.RecordMigration1.self)
    config.preparations.append(Record.RecordMigration2.self)
    config.preparations.append(Record.RecordMigration3.self)
    config.addConfigurable(command: Fetch.init, name: "fetch")
    config.addConfigurable(command: Parse.init, name: "parse")
  }

  public func boot(_ drop: Droplet) throws {
    RawRecord.database = drop.database
    Record.database = drop.database
    let routes = Routes(drop.view)
    try drop.collection(routes)
  }

  public func beforeRun(_ drop: Droplet) throws {
    // If we are running `serve`, then start running background jobs.
    let args = drop.config.arguments.dropFirst()
    guard args.count == 0 || args.first == "serve" else {
      return
    }
    Jobs.add(interval: .seconds(5*60)) {
      // Run a Fetch, and then a Parse.
      try Fetch(config: drop.config).run(arguments: [])
      try Parse(config: drop.config).run(arguments: [])
    }
  }

}
