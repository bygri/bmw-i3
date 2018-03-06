import ConnectedDrive
import Console
import Foundation
import Vapor

final class Parse: Command, ConfigInitializable {
  let id = "parse"
  let help = ["Parses ConnectedDrive info. Add argument `reset` to re-parse all records."]
  let console: ConsoleProtocol
  let log: LogProtocol

  init(config: Config) throws {
    console = try config.resolveConsole()
    log = try config.resolveLog()
  }

  func run(arguments: [String]) throws  {
    log.info("Starting Parse.")
    // If argument "reset" is included, clear all Records first.
    if arguments.contains("reset") {
      log.info("Deleting all existing parsed records.")
      try Record.database?.raw("DELETE FROM `\(Record.entity)`")
    }
    // Remove parse errors from all existing raw records. We'll try them again.
    try RawRecord.database?.raw("UPDATE `\(RawRecord.entity)` SET `parseError` = NULL")
    // Find all unparsed RawRecords, and attempt to parse them into Records.
    let rawQuery = try RawRecord.makeQuery()
      .join(kind: .outer, Record.self)
      .filter("parseError", nil)
      .filter(Record.self, "id", nil)
    try log.info("\(rawQuery.count()) raw records to parse.")
    while try rawQuery.count() > 0 {
      try rawQuery.limit(8).all().forEach { rawRecord in
        do {
          let attributes = try JSONDecoder().decode(DynamicResponse.self, from: Data(rawRecord.data)).attributesMap
          let record = try Record(rawRecordId: rawRecord.assertExists(), attributes: attributes)
          try record.save()
          log.info("Successfully parsed raw record.")
        } catch {
          let errorMessage = String(describing: error)
          log.error("Error parsing raw record: \(errorMessage)")
          rawRecord.parseError = errorMessage
          try rawRecord.save()
        }
      }
    }
    log.info("Parse completed.")
  }
}
