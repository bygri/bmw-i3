import ConnectedDrive
import FluentProvider
import Foundation
import Vapor

final class VehicleState: Model {

  enum ChargeState {
    case charging(level: Int)
    case notCharging(level: Int)
    case chargingError(level: Int)
  }

  enum FuelState {
    case hasFuelTank(level: Int)
    case noFuelTank
  }

  struct Location {
    let latitude: Double
    let longitude: Double
    let heading: Int
  }

  var date: Date
  var odometer: Int
  var chargeState: ChargeState
  var fuelState: FuelState
  var location: Location
  var isLocked: Bool

  // Set the current status from this Record.
  // Does not do any diffing. Don't use this for a change of state.
  init(record: Record) {
    date = record.date
    odometer = record.odometer
    isLocked = record.isLocked
    location = Location(
      latitude: record.latitude,
      longitude: record.longitude,
      heading: record.heading
    )
    switch (record.isCharging, record.chargingEndResult) {
      case (true, _):
        chargeState = .charging(level: Int(record.batteryPercent))
      case (false, _):
        chargeState = .notCharging(level: Int(record.batteryPercent))
    }
    fuelState = .hasFuelTank(level: record.fuelPercent) // TODO: what about BEV?
  }

  // This should trigger state changes.
  func update(from record: Record) {
    date = record.date
    odometer = record.odometer
    isLocked = record.isLocked
    location = Location(
      latitude: record.latitude,
      longitude: record.longitude,
      heading: record.heading
    )
    switch (record.isCharging, record.chargingEndResult) {
      case (true, _):
        chargeState = .charging(level: Int(record.batteryPercent))
      case (false, _):
        chargeState = .notCharging(level: Int(record.batteryPercent))
    }
    fuelState = .hasFuelTank(level: record.fuelPercent) // TODO: what about BEV?
  }

  // Fluent

  let storage = Storage()

  init(row: Row) throws {
    date = try row.get("date")
    odometer = try row.get("odometer")
    isLocked = try row.get("isLocked")
    location = try Location(
      latitude: row.get("locationLatitude"),
      longitude: row.get("locationLongitude"),
      heading: row.get("locationHeading")
    )
    let chargeLevel: Int = try row.get("chargeLevel")
    switch try row.get("chargeState") as String {
      case "charging":
        chargeState = .charging(level: chargeLevel)
      case "notCharging":
        chargeState = .notCharging(level: chargeLevel)
      case "chargeError":
        chargeState = .chargingError(level: chargeLevel)
      default:
        fatalError() // TODO: don't do this
    }
    let fuelLevel: Int = try row.get("fuelLevel")
    switch try row.get("fuelState") as String {
      case "hasFuelTank":
        fuelState = .hasFuelTank(level: fuelLevel)
      case "noFuelTank":
        fuelState = .noFuelTank
      default:
        fatalError() // TODO: don't do this
    }
  }

  func makeRow() throws -> Row {
    var row = Row()
    try row.set("date", date)
    try row.set("odometer", odometer)
    try row.set("isLocked", isLocked)
    try row.set("locationLatitude", location.latitude)
    try row.set("locationLongitude", location.longitude)
    try row.set("locationHeading", location.heading)
    switch chargeState {
      case let .charging(level):
        try row.set("chargeState", "charging")
        try row.set("chargeLevel", level)
      case let .notCharging(level):
        try row.set("chargeState", "notCharging")
        try row.set("chargeLevel", level)
      case let .chargingError(level):
        try row.set("chargeState", "chargingError")
        try row.set("chargeLevel", level)
    }
    switch fuelState {
      case let .hasFuelTank(level):
        try row.set("fuelState", "hasFuelTank")
        try row.set("fuelLevel", level)
      case .noFuelTank:
        try row.set("fuelState", "noFuelTank")
        try row.set("fuelLevel", 0)
    }
    return row
  }

}
