import ConnectedDrive
import FluentProvider
import Foundation
import Vapor

/**
Stores raw responses from ConnectedDrive.

This is so that future versions of the app can retroactively re-parse responses
as new functionality is added.
*/
final class RawRecord: Model {

  let date: Date
  let data: Bytes
  let checksum: Int
  var parseError: String?

  init(data: Bytes) {
    date = Date()
    self.data = data
    checksum = data.map { Int($0) }.reduce(0, +)
  }

  // Fluent

  let storage = Storage()

  init(row: Row) throws {
    date = try row.get("date")
    let dataBlob: Blob = try row.get("data")
    data = dataBlob.bytes
    checksum = try row.get("checksum")
    parseError = try row.get("parseError")
  }

  func makeRow() throws -> Row {
    var row = Row()
    try row.set("date", date)
    try row.set("data", Blob(bytes: data))
    try row.set("checksum", checksum)
    try row.set("parseError", parseError)
    return row
  }

}
