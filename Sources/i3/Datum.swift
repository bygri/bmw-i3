import ConnectedDrive
import FluentProvider
import Foundation
import Vapor

final class Datum: Model {

  let date: Date
  let odometer: Int

  let stateOfCharge: Double
  let maxStateOfCharge: Double
  let batteryPercent: Double // use chargingLevelHv or soc_hv_percent?
  let fuelPercent: Int

  let isCharging: Bool
  let isConnected: Bool
  let isLocked: Bool

  let sourceFile: Bytes

  init(_ attributes: Dynamic.AttributesMap) throws {
    date = Date()
    odometer = attributes.mileage
    stateOfCharge = 0
    maxStateOfCharge = 0
    batteryPercent = attributes.chargingLevelHv
    fuelPercent = attributes.fuelPercent
    isCharging = attributes.chargingStatus == .chargingActive
    isConnected = attributes.connectorStatus == .connected
    isLocked = attributes.doorLockState == .secured
    sourceFile = try JSONEncoder().encode(attributes).makeBytes()
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
    sourceFile = try row.get("sourceFile")
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
    try row.set("sourceFile", sourceFile)
    return row
  }

}

extension Datum {

  struct Migration1: Preparation {
    static func prepare(_ database: Database) throws {
      try database.create(Datum.self) { builder in
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
        builder.bytes("soureFile")
      }
    }
    static func revert(_ database: Database) throws {
      try database.delete(Datum.self)
    }
  }

}
