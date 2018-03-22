import FluentProvider
import Vapor

struct Migrations {

  static func add(to config: Config) {
    config.preparations.append(Migrations.V1.self)
    config.preparations.append(Migrations.V2.self)
    config.preparations.append(Migrations.V3.self)
    config.preparations.append(Migrations.V4.self)
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

  struct V2: Preparation {
    static func prepare(_ database: Database) throws {
      try database.modify(Record.self) { builder in
        builder.date("estimatedChargeCompletionDate", optional: true)
      }
    }
    static func revert(_ database: Database) throws {}
  }

  struct V3: Preparation {
    static func prepare(_ database: Database) throws {
      try database.create(VehicleState.self) { builder in
        builder.id()
        builder.date("date")
        builder.int("odometer")
        builder.bool("isLocked")
        builder.double("locationLatitude")
        builder.double("locationLongitude")
        builder.int("locationHeading")
        builder.string("chargeState")
        builder.int("chargeLevel")
        builder.string("fuelState")
        builder.int("fuelLevel")
      }
    }
    static func revert(_ database: Database) throws {
      try database.delete(VehicleState.self)
    }
  }

  struct V4: Preparation {
    static func prepare(_ database: Database) throws {
      try database.modify(RawRecord.self) { builder in
        builder.delete("parseError")
      }
      try database.create(RawRecordError.self) { builder in
        builder.id()
        builder.foreignId(for: RawRecord.self)
        builder.custom("description", type: "TEXT")
        builder.bool("isPermanent")
      }
      Record.database = database
      try Record.makeQuery().delete()
    }
    static func revert(_ database: Database) throws {
      try database.modify(RawRecord.self) { builder in
        builder.string("parseError", optional: true)
      }
      try database.delete(RawRecordError.self)
    }
  }

}
