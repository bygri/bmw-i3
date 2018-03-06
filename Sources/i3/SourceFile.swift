import ConnectedDrive
import FluentProvider
import Foundation
import Vapor

/**
Stores raw responses from ConnectedDrive.

This is so that future versions of the app can retroactively re-parse responses
as new functionality is added.
*/
final class SourceFile: Model {

  let date: Date
  let data: Bytes
  var parseError: String?

  init(data: Bytes) {
    date = Date()
    self.data = data
  }

  // Fluent

  let storage = Storage()

  init(row: Row) throws {
    date = try row.get("date")
    let dataBlob: Blob = try row.get("data")
    data = dataBlob.bytes
    parseError = try row.get("parseError")
  }

  func makeRow() throws -> Row {
    var row = Row()
    try row.set("date", date)
    try row.set("data", Blob(bytes: data))
    try row.set("parseError", parseError)
    return row
  }

  struct SourceFileMigration1: Preparation {
    static func prepare(_ database: Database) throws {
      try database.create(SourceFile.self) { builder in
        builder.id()
        builder.date("date")
        builder.bytes("data")
        builder.string("parseError", optional: true)
      }
    }
    static func revert(_ database: Database) throws {
      try database.delete(SourceFile.self)
    }
  }

}
