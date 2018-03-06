import ConnectedDrive
import FluentProvider
import Foundation
import Vapor

/**
Stores useful info from ConnectedDrive in a queryable form.
*/
final class Record: Model {

  let date: Date
  let odometer: Int

  let stateOfCharge: Double
  let maxStateOfCharge: Double
  let batteryPercent: Double // use chargingLevelHv or soc_hv_percent?
  let fuelPercent: Int

  let isCharging: Bool
  let isConnected: Bool
  let isLocked: Bool

  let chargingEndResult: DynamicResponse.ChargingEndResult
  let chargingEndReason: DynamicResponse.ChargingEndReason
  let updateReason: DynamicResponse.UpdateReason

  let latitude: Double
  let longitude: Double
  let heading: Int

  let rawRecordId: Identifier

  init(rawRecordId: Identifier, attributes: DynamicResponse.AttributesMap) throws {
    self.rawRecordId = rawRecordId
    date = attributes.updateTime
    odometer = attributes.mileage
    stateOfCharge = 0
    maxStateOfCharge = 0
    batteryPercent = attributes.chargingLevelHv
    // batteryPercent = attributes.socHVPercent // this doesnt appear to change much
    fuelPercent = attributes.fuelPercent
    isCharging = attributes.chargingStatus == .chargingActive
    isConnected = attributes.connectorStatus == .connected
    isLocked = attributes.doorLockState == .secured
    chargingEndResult = attributes.lastChargingEndResult
    chargingEndReason = attributes.lastChargingEndReason
    updateReason = attributes.lastUpdateReason
    latitude = attributes.gpsLat
    longitude = attributes.gpsLng
    heading = attributes.heading
  }

  // Fluent

  let storage = Storage()

  init(row: Row) throws {
    date = try row.get("date")
    odometer = try row.get("odometer")
    stateOfCharge = try row.get("stateOfCharge")
    maxStateOfCharge = try row.get("maxStateOfCharge")
    batteryPercent = try row.get("batteryPercent")
    fuelPercent = try row.get("fuelPercent")
    isCharging = try row.get("isCharging")
    isConnected = try row.get("isConnected")
    isLocked = try row.get("isLocked")
    chargingEndResult = try DynamicResponse.ChargingEndResult(rawValue: row.get("chargingEndResult"))!
    chargingEndReason = try DynamicResponse.ChargingEndReason(rawValue: row.get("chargingEndReason"))!
    updateReason = try DynamicResponse.UpdateReason(rawValue: row.get("updateReason"))!
    latitude = try row.get("latitude")
    longitude = try row.get("longitude")
    heading = try row.get("heading")
    rawRecordId = try row.get("rawRecordId")
  }

  func makeRow() throws -> Row {
    var row = Row()
    try row.set("date", date)
    try row.set("odometer", odometer)
    try row.set("stateOfCharge", stateOfCharge)
    try row.set("maxStateOfCharge", maxStateOfCharge)
    try row.set("batteryPercent", batteryPercent)
    try row.set("fuelPercent", fuelPercent)
    try row.set("isCharging", isCharging)
    try row.set("isConnected", isConnected)
    try row.set("isLocked", isLocked)
    try row.set("chargingEndResult", chargingEndResult.rawValue)
    try row.set("chargingEndReason", chargingEndReason.rawValue)
    try row.set("updateReason", updateReason.rawValue)
    try row.set("latitude", latitude)
    try row.set("longitude", longitude)
    try row.set("heading", heading)
    try row.set("rawRecordId", rawRecordId)
    return row
  }

  struct RecordMigration1: Preparation {
    static func prepare(_ database: Database) throws {
      try database.create(Record.self) { builder in
        builder.id()
        builder.date("date")
        builder.int("odometer")
        builder.double("stateOfCharge")
        builder.double("maxStateOfCharge")
        builder.double("batteryPercent")
        builder.int("fuelPercent")
        builder.bool("isCharging")
        builder.bool("isConnected")
        builder.bool("isLocked")
        builder.foreignId(for: RawRecord.self)
      }
    }
    static func revert(_ database: Database) throws {
      try database.delete(Record.self)
    }
  }

  struct RecordMigration2: Preparation {
    static func prepare(_ database: Database) throws {
      try database.modify(Record.self) { builder in
        builder.double("latitude")
        builder.double("longitude")
        builder.int("heading")
      }
    }
    static func revert(_ database: Database) throws {}
  }

  struct RecordMigration3: Preparation {
    static func prepare(_ database: Database) throws {
      try database.modify(Record.self) { builder in
        builder.string("chargingEndResult")
        builder.string("chargingEndReason")
        builder.string("updateReason")
      }
    }
    static func revert(_ database: Database) throws {}
  }

}
