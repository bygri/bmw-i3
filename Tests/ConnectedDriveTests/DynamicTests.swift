import XCTest
import ConnectedDrive

// Privacy: change `gps_lat`, `gps_lng`.

class DynamicTests: XCTestCase {

  static let allTests = [
    ("testFileOne", testFileOne),
    ("testFileTwo", testFileTwo),
  ]

  func testFileOne() throws {
    // At work, charging level 2.
    let jsonFile = """
    {
      "attributesMap" : {
        "updateTime_converted" : "05.03.2018 07:49",
        "shdStatusUnified" : "CLOSED",
        "condition_based_services" : "00003,OK,2018-07,;00001,OK,2018-07,;00017,OK,2019-01,",
        "door_lock_state" : "SECURED",
        "vehicle_tracking" : "1",
        "Segment_LastTrip_time_segment_end_formatted_time" : "07:25",
        "lastChargingEndReason" : "UNKNOWN",
        "door_passenger_front" : "CLOSED",
        "charging_inductive_positioning" : "not_positioned",
        "fuelPercent" : "47",
        "check_control_messages" : "",
        "beMaxRangeElectricMile" : "151.0",
        "chargingHVStatus" : "CHARGING",
        "lights_parking" : "OFF",
        "beRemainingRangeFuelKm" : "84.0",
        "connectorStatus" : "CONNECTED",
        "kombi_current_remaining_range_fuel" : "84.0",
        "beRemainingRangeElectricMile" : "128.0",
        "window_passenger_front" : "CLOSED",
        "mileage" : "24521",
        "door_driver_front" : "CLOSED",
        "updateTime" : "04.03.2018 20:49:59 UTC",
        "window_passenger_rear" : "CLOSED",
        "Segment_LastTrip_time_segment_end" : "05.03.2018 07:25:00 UTC",
        "remaining_fuel" : "4",
        "updateTime_converted_time" : "07:49",
        "window_driver_front" : "CLOSED",
        "chargeNowAllowed" : "NOT_ALLOWED",
        "chargingTimeRemaining" : "60.0",
        "unitOfCombustionConsumption" : "l/100km",
        "beMaxRangeElectric" : "244.0",
        "soc_hv_percent" : "80.0",
        "single_immediate_charging" : "isUnused",
        "beRemainingRangeElectric" : "206.0",
        "heading" : "181",
        "DCS_CCH_Ongoing " : null,
        "sunroof_state" : "CLOSED",
        "charging_connection_type" : "CONDUCTIVE",
        "Segment_LastTrip_time_segment_end_formatted" : "05.03.2018 07:25",
        "updateTime_converted_timestamp" : "1520236199000",
        "gps_lat" : "-2.73548",
        "window_driver_rear" : "CLOSED",
        "lastChargingEndResult" : "UNKNOWN",
        "trunk_state" : "CLOSED",
        "hood_state" : "CLOSED",
        "chargingLevelHv" : "86.0",
        "lastUpdateReason" : "CHARGINGSTARTED",
        "beRemainingRangeFuel" : "84.0",
        "sunroof_position" : "0",
        "lsc_trigger" : "CHARGINGSTARTED",
        "unitOfEnergy" : "kWh",
        "Segment_LastTrip_time_segment_end_formatted_date" : "05.03.2018",
        "prognosisWhileChargingStatus" : "IS_PERFORMED",
        "beMaxRangeElectricKm" : "244.0",
        "unitOfElectricConsumption" : "kWh/100km",
        "Segment_LastTrip_ratio_electric_driven_distance" : "100",
        "head_unit_pu_software" : "07/14",
        "DCS_CCH_Activation" : null,
        "head_unit" : "NBT",
        "chargingSystemStatus" : "CHARGINGACTIVE",
        "door_driver_rear" : "CLOSED",
        "charging_status" : "CHARGINGACTIVE",
        "beRemainingRangeFuelMile" : "52.0",
        "beRemainingRangeElectricKm" : "206.0",
        "gps_lng" : "70.69255",
        "door_passenger_rear" : "CLOSED",
        "updateTime_converted_date" : "05.03.2018",
        "unitOfLength" : "km",
        "chargingLogicCurrentlyActive" : "DIRECT_CHARGING",
        "battery_size_max" : "35820"
      },
      "vehicleMessages" : {
        "ccmMessages" : [ ],
        "cbsMessages" : [ {
          "description" : "Next change due at the latest by the stated date.",
          "text" : "Brake fluid",
          "id" : 3,
          "status" : "OK",
          "messageType" : "CBS",
          "date" : "2018-07"
        }, {
          "description" : "Next service due when the stated distance has been covered or by the specified date.",
          "text" : "Engine oil",
          "id" : 1,
          "status" : "OK",
          "messageType" : "CBS",
          "date" : "2018-07"
        }, {
          "description" : "Next visual inspection due when the stated distance has been covered or by the stated date.",
          "text" : "Vehicle check",
          "id" : 17,
          "status" : "OK",
          "messageType" : "CBS",
          "date" : "2019-01"
        } ]
      }
    }
    """.data(using: .utf8)!
    let dynamic = try JSONDecoder().decode(Dynamic.self, from: jsonFile)
    XCTAssertEqual(dynamic.attributesMap.fuelPercent, "47")
  }

  func testFileTwo() throws {
    // At home, not charging.
    let jsonFile = """
    {
      "attributesMap" : {
        "updateTime_converted" : "05.03.2018 15:21",
        "shdStatusUnified" : "CLOSED",
        "condition_based_services" : "00003,OK,2018-07,;00001,OK,2018-07,;00017,OK,2019-01,",
        "door_lock_state" : "SECURED",
        "vehicle_tracking" : "1",
        "Segment_LastTrip_time_segment_end_formatted_time" : "15:21",
        "lastChargingEndReason" : "CHARGING_GOAL_REACHED",
        "door_passenger_front" : "CLOSED",
        "charging_inductive_positioning" : "not_positioned",
        "fuelPercent" : "47",
        "check_control_messages" : "",
        "beMaxRangeElectricMile" : "101.0",
        "chargingHVStatus" : "INVALID",
        "lights_parking" : "OFF",
        "beRemainingRangeFuelKm" : "57.0",
        "connectorStatus" : "DISCONNECTED",
        "kombi_current_remaining_range_fuel" : "57.0",
        "beRemainingRangeElectricMile" : "67.0",
        "window_passenger_front" : "CLOSED",
        "mileage" : "24568",
        "door_driver_front" : "CLOSED",
        "updateTime" : "05.03.2018 04:21:45 UTC",
        "window_passenger_rear" : "CLOSED",
        "Segment_LastTrip_time_segment_end" : "05.03.2018 15:21:00 UTC",
        "remaining_fuel" : "4",
        "updateTime_converted_time" : "15:21",
        "window_driver_front" : "CLOSED",
        "chargeNowAllowed" : "NOT_ALLOWED",
        "unitOfCombustionConsumption" : "l/100km",
        "beMaxRangeElectric" : "163.0",
        "soc_hv_percent" : "68.3",
        "single_immediate_charging" : "isUnused",
        "beRemainingRangeElectric" : "108.0",
        "heading" : "104",
        "DCS_CCH_Ongoing " : null,
        "sunroof_state" : "CLOSED",
        "charging_connection_type" : "CONDUCTIVE",
        "Segment_LastTrip_time_segment_end_formatted" : "05.03.2018 15:21",
        "updateTime_converted_timestamp" : "1520263305000",
        "gps_lat" : "-2.716946",
        "window_driver_rear" : "CLOSED",
        "lastChargingEndResult" : "SUCCESS",
        "trunk_state" : "CLOSED",
        "hood_state" : "CLOSED",
        "chargingLevelHv" : "69.0",
        "lastUpdateReason" : "VEHCSHUTDOWN_SECURED",
        "beRemainingRangeFuel" : "57.0",
        "sunroof_position" : "0",
        "lsc_trigger" : "VEHCSHUTDOWN_SECURED",
        "unitOfEnergy" : "kWh",
        "Segment_LastTrip_time_segment_end_formatted_date" : "05.03.2018",
        "prognosisWhileChargingStatus" : "NOT_NEEDED",
        "beMaxRangeElectricKm" : "163.0",
        "unitOfElectricConsumption" : "kWh/100km",
        "Segment_LastTrip_ratio_electric_driven_distance" : "100",
        "head_unit_pu_software" : "07/14",
        "DCS_CCH_Activation" : null,
        "head_unit" : "NBT",
        "chargingSystemStatus" : "NOCHARGING",
        "door_driver_rear" : "CLOSED",
        "charging_status" : "NOCHARGING",
        "beRemainingRangeFuelMile" : "35.0",
        "beRemainingRangeElectricKm" : "108.0",
        "gps_lng" : "33.33525",
        "door_passenger_rear" : "CLOSED",
        "updateTime_converted_date" : "05.03.2018",
        "unitOfLength" : "km",
        "chargingLogicCurrentlyActive" : "NOT_CHARGING",
        "battery_size_max" : "35820"
      },
      "vehicleMessages" : {
        "ccmMessages" : [ ],
        "cbsMessages" : [ {
          "description" : "Next change due at the latest by the stated date.",
          "text" : "Brake fluid",
          "id" : 3,
          "status" : "OK",
          "messageType" : "CBS",
          "date" : "2018-07"
        }, {
          "description" : "Next service due when the stated distance has been covered or by the specified date.",
          "text" : "Engine oil",
          "id" : 1,
          "status" : "OK",
          "messageType" : "CBS",
          "date" : "2018-07"
        }, {
          "description" : "Next visual inspection due when the stated distance has been covered or by the stated date.",
          "text" : "Vehicle check",
          "id" : 17,
          "status" : "OK",
          "messageType" : "CBS",
          "date" : "2019-01"
        } ]
      }
    }
    """.data(using: .utf8)!
    let dynamic = try JSONDecoder().decode(Dynamic.self, from: jsonFile)
    XCTAssertEqual(dynamic.attributesMap.fuelPercent, "47")
  }

}
