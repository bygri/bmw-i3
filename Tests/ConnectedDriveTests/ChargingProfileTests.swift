import XCTest
import ConnectedDrive

// Privacy: no particularly private info in this file.

class ChargingProfileTests: XCTestCase {

  static let allTests = [
    ("testFile", testFile),
  ]

  func testFile() throws {
    let jsonFile = """
    {
      "weekTimer" : {
        "departureTimes" : {
          "departureTimeLong" : [ {
            "departureTime" : {
              "hours" : 6,
              "minutes" : 15
            },
            "weekdays" : {
              "weekday" : [ "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY" ]
            },
            "timerActive" : "ACTIVATE"
          }, {
            "departureTime" : {
              "hours" : 14,
              "minutes" : 0
            },
            "weekdays" : {
              "weekday" : [ "MONDAY", "TUESDAY", "WEDNESDAY" ]
            },
            "timerActive" : "ACTIVATE"
          }, {
            "departureTime" : {
              "hours" : 7,
              "minutes" : 15
            },
            "weekdays" : {
              "weekday" : [ "SATURDAY" ]
            },
            "timerActive" : "ACTIVATE"
          }, {
            "departureTime" : {
              "hours" : 14,
              "minutes" : 0
            },
            "weekdays" : {
              "weekday" : [ "MONDAY" ]
            },
            "timerActive" : "DEACTIVATE"
          } ]
        },
        "climatisationOn" : "IS_TRUE",
        "reductionOfChargeCurrent" : {
          "start" : {
            "hours" : 10,
            "minutes" : 0
          },
          "end" : {
            "hours" : 5,
            "minutes" : 0
          }
        },
        "immediateCharging" : "IS_TRUE",
        "chargingPreference" : "CHARGING_WINDOW"
      },
      "pendingUpdate" : false,
      "xmlVersion" : {
        "minor" : 9,
        "major" : 1
      }
    }
    """.data(using: .utf8)!
    let chargingProfile = try JSONDecoder().decode(ChargingProfile.self, from: jsonFile)
  }

}
