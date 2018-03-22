import FluentProvider
import Foundation
import Vapor

/**
Stores error data about a RawRecord.
*/
final class RawRecordError: Model {
  let rawRecordId: Identifier
  let description: String
  let isPermanent: Bool

  init(_ rawRecord: RawRecord, _ error: Error) throws {
    rawRecordId = try rawRecord.assertExists()
    if let error = error as? NSError {
      description = "\(error.code) \(error.domain): \(error.localizedDescription) - \(error.userInfo)"
    } else {
      description = String(describing: error)
    }
    isPermanent = false
  }

  // Fluent

  let storage = Storage()

  init(row: Row) throws {
    rawRecordId = try row.get("rawRecordId")
    description = try row.get("description")
    isPermanent = try row.get("isPermanent")
  }

  func makeRow() throws -> Row {
    var row = Row()
    try row.set("rawRecordId", rawRecordId)
    try row.set("description", description)
    try row.set("isPermanent", isPermanent)
    return row
  }

}
