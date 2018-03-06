import HTTP
import JSON
import Vapor

final class Routes: RouteCollection {

  func build(_ builder: RouteBuilder) throws {
    builder.get("records") { req in
      // Sneaky HTML table of all records
      var html = """
      <html><head></head><body>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Odometer</th>
            <th>Battery</th>
            <th>Fuel</th>
            <th>Charging</th>
            <th>Connected</th>
            <th>Locked</th>
          </tr>
        </thead>
        <tbody>
      """
      try Record.makeQuery().chunk(4) { try $0.forEach { record in
        html += try """
          <tr>
            <th>\(record.assertExists().int!)</th>
            <td>\(record.date)</td>
            <td>\(record.odometer)</td>
            <td>\(record.batteryPercent)%</td>
            <td>\(record.fuelPercent)%</td>
            <td>\(record.isCharging)</td>
            <td>\(record.isConnected)</td>
            <td>\(record.isLocked)</td>
          </tr>
        """
      }}
      html += """
        </tbody>
      </table>
      </body></html>
      """
      return Response(status: .ok, body: html)
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
