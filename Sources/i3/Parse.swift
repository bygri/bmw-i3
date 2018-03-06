import Cache
import Console
import Foundation
import Vapor

final class Parse: Command, ConfigInitializable {
  let id = "parse"
  let help = ["Parses ConnectedDrive info."]
  let console: ConsoleProtocol
  let log: LogProtocol

  init(config: Config) throws {
    console = try config.resolveConsole()
    log = try config.resolveLog()
  }

  func run(arguments: [String]) throws  {
    let unparsed = try SourceFile.makeQuery()
      .join(kind: .outer, Datum.self)
      .filter(Datum.self, "id", nil)
    try log.info("\(unparsed.count()) records to parse.")
    try unparsed.chunk(8) { records in
      try records.forEach { record in
        do {
          let datum = try Datum(parsing: record)
          try datum.save()
        } catch {
          let errorMessage = String(describing: error)
          log.error("Error parsing Dynamic data: \(errorMessage)")
          record.parseError = errorMessage
          try record.save()
        }
      }
    }
    log.info("Parsing complete.")
  }
}
