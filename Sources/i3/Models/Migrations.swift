import FluentProvider
import Vapor

struct Migrations {

  static func add(to config: Config) {
    config.preparations.append(Migrations.V1.self)
  }

  struct V1: Preparation {
    static func prepare(_ database: Database) throws {
      try database.create(RawRecord.self) { builder in
        builder.id()
        builder.date("date")
        builder.bytes("data")
        builder.int("checksum")
        builder.string("parseError", optional: true)
      }
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
        builder.double("latitude")
        builder.double("longitude")
        builder.int("heading")
        builder.string("chargingEndResult")
        builder.string("chargingEndReason")
        builder.string("updateReason")
        builder.foreignId(for: RawRecord.self)
      }
    }
    static func revert(_ database: Database) throws {
      try database.delete(Record.self)
      try database.delete(RawRecord.self)
    }
  }

}