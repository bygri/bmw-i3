import ConnectedDrive
import Console
import Foundation
import Vapor

/**
Updates the current State from the most recent Record.
*/
final class State: Command, ConfigInitializable {
  let id = "state"
  let help = ["Updates the current vehicle state. Pass argument `reset` to ignore state change notifications."]
  let console: ConsoleProtocol
  let log: LogProtocol

  convenience init(config: Config) throws {
    try self.init(
      console: config.resolveConsole(),
      log: config.resolveLog()
    )
  }

  init(
    console: ConsoleProtocol,
    log: LogProtocol
  ) throws {
    self.console = console
    self.log = log
  }

  func run(arguments: [String]) throws  {
    log.info("Starting State.")
    // If argument "reset" is included, clear current State first.
    if arguments.contains("reset") {
      log.info("Deleting prior State.")
      try VehicleState.makeQuery().delete()
    }
    // Get the latest Record
    guard let record = try Record.makeQuery().sort("date", .descending).sort("id", .descending).first() else {
      log.error("No records yet; can't update state.")
      return
    }
    // Find the current State; or, create it if there isn't one.
    guard let state = try VehicleState.makeQuery().first() else {
      let state = VehicleState(record: record)
      try state.save()
      log.info("Created a new VehicleState.")
      return
    }
    // Update it
    state.update(from: record)
    try state.save()
    log.info("Updated VehicleState.")
  }
}
