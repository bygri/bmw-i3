import Foundation
import HTTP
import JSON
import Vapor

final class Routes: RouteCollection {
  let view: ViewRenderer
  let timezone: TimeZone

  init(_ view: ViewRenderer, _ timezone: TimeZone) {
    self.view = view
    self.timezone = timezone
  }

  func build(_ builder: RouteBuilder) throws {
    // Status page
    builder.get() { req in
      return try self.view.make("Status")
    }

    // Records index: show all records
    builder.get("records") { req in
      let dateFormatter = DateFormatter()
      dateFormatter.timeZone = self.timezone
      dateFormatter.dateStyle = .short
      dateFormatter.timeStyle = .short
      var ctx = Node([:])
      try ctx.set("records", Record.makeQuery().all().map { record in
        var node = Node([:])
        try node.set("id", record.id)
        try node.set("date", dateFormatter.string(from: record.date))
        try node.set("odometer", record.odometer)
        try node.set("batteryPercent", record.batteryPercent)
        try node.set("fuelPercent", record.fuelPercent)
        try node.set("isCharging", record.isCharging)
        try node.set("isConnected", record.isConnected)
        try node.set("isLocked", record.isLocked)
        try node.set("latitude", record.latitude)
        try node.set("longitude", record.longitude)
        try node.set("heading", record.heading)
        try node.set("chargingEndResult", record.chargingEndResult.rawValue)
        try node.set("chargingEndReason", record.chargingEndReason.rawValue)
        try node.set("updateReason", record.updateReason.rawValue)
        return node
      })
      return try self.view.make("RecordIndex", ctx)
    }

    builder.get("records", Record.parameter) { req in
      let record = try req.parameters.next(Record.self)
      guard let rawRecord = try record.rawRecord.get() else {
        throw Abort.notFound
      }
      let dateFormatter = DateFormatter()
      dateFormatter.timeZone = self.timezone
      dateFormatter.dateStyle = .short
      dateFormatter.timeStyle = .short
      var ctx = Node([:])
      try ctx.set("record.id", record.id)
      try ctx.set("record.date", dateFormatter.string(from: record.date))
      try ctx.set("record.odometer", record.odometer)
      try ctx.set("record.batteryPercent", record.batteryPercent)
      try ctx.set("record.fuelPercent", record.fuelPercent)
      try ctx.set("record.isCharging", record.isCharging)
      try ctx.set("record.isConnected", record.isConnected)
      try ctx.set("record.isLocked", record.isLocked)
      try ctx.set("record.latitude", record.latitude)
      try ctx.set("record.longitude", record.longitude)
      try ctx.set("record.heading", record.heading)
      try ctx.set("record.chargingEndResult", record.chargingEndResult.rawValue)
      try ctx.set("record.chargingEndReason", record.chargingEndReason.rawValue)
      try ctx.set("record.updateReason", record.updateReason.rawValue)
      try ctx.set("rawRecord", rawRecord.data.makeString())
      return try self.view.make("Record", ctx)
    }
  }

}
