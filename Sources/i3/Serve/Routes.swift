import HTTP
import JSON
import Vapor

final class Routes: RouteCollection {
  let view: ViewRenderer

  init(_ view: ViewRenderer) {
    self.view = view
  }

  func build(_ builder: RouteBuilder) throws {
    // Index: redirect to records
    builder.get() { req in
      return Response(redirect: "/records")
    }

    // Records index: show all records
    builder.get("records") { req in
      var ctx = Node([:])
      try ctx.set("records", Record.makeQuery().all().map { record in
        var node = Node([:])
        try node.set("date", record.date)
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
      return try self.view.make("Records", ctx)
    }

    builder.get("records", Record.parameter) { req in
      let record = try req.parameters.next(Record.self)
      var json = JSON()
      try json.set("date", record.date)
      try json.set("odometer", record.odometer)
      try json.set("batteryPercent", record.batteryPercent)
      try json.set("fuelPercent", record.fuelPercent)
      try json.set("isCharging", record.isCharging)
      try json.set("isConnected", record.isConnected)
      try json.set("isLocked", record.isLocked)
      return json
    }
  }

}
