import XCTest
import ConnectedDrive

// Privacy: change `latitude`, `longitude` and `isoCountryCode`.

class NavigationTests: XCTestCase {

  static let allTests = [
    ("testFile", testFile),
  ]

  func testFile() throws {
    let jsonFile = """
    {
      "latitude" : -2.73548,
      "longitude" : -69.54234,
      "isoCountryCode" : "XXX",
      "auxPowerRegular" : 1.4,
      "auxPowerEcoPro" : 1.2,
      "auxPowerEcoProPlus" : 0.4,
      "soc" : 25.200651168823242,
      "socMax" : 29.74,
      "pendingUpdate" : false,
      "vehicleTracking" : true
    }
    """.data(using: .utf8)!
    let navigation = try JSONDecoder().decode(Navigation.self, from: jsonFile)
    XCTAssertEqual(navigation.auxPowerRegular, 1.4)
    XCTAssertEqual(navigation.auxPowerEcoPro, 1.2)
    XCTAssertEqual(navigation.auxPowerEcoProPlus, 0.4)
    XCTAssertEqual(navigation.soc, 25.200651168823242)
    XCTAssertEqual(navigation.socMax, 29.74)
    XCTAssertEqual(navigation.pendingUpdate, false)
    XCTAssertEqual(navigation.vehicleTracking, true)
  }

}
