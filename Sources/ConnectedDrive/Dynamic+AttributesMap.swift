extension Dynamic {
  public struct AttributesMap: Codable {
    public let batterySizeMax: String
    public let beMaxRangeElectric: String
    public let beMaxRangeElectricKm: String
    public let beMaxRangeElectricMile: String
    public let beRemainingRangeElectric: String
    public let beRemainingRangeElectricKm: String
    public let beRemainingRangeElectricMile: String
    public let beRemainingRangeFuel: String
    public let beRemainingRangeFuelKm: String
    public let beRemainingRangeFuelMile: String
    public let chargeNowAllowed: ChargeNowAllowed
    public let chargingConnectionType: ChargingConnectionType
    public let chargingHVStatus: ChargingHVStatus
    public let chargingInductivePositioning: ChargingInductivePositioning
    public let chargingLevelHv: String
    public let chargingLogicCurrentlyActive: ChargingLogic
    public let chargingStatus: ChargingStatus
    public let chargingSystemStatus: ChargingStatus
    public let chargingTimeRemaining: String?
    public let checkControlMessages: String
    public let conditionBasedServices: String
    public let connectorStatus: ConnectorStatus
    public let dcsCCHActivation: String? // have only seen nil
    public let dcsCCHOngoing: String? // have only seen nil
    public let doorDriverFront: DoorStatus
    public let doorDriverRear: DoorStatus
    public let doorLockState: DoorLockState
    public let doorPassengerFront: OpenCloseState
    public let doorPassengerRear: DoorStatus
    public let gpsLat: String
    public let gpsLng: String
    public let heading: String
    public let headUnit: HeadUnit
    public let headUnitPUSoftware: String
    public let hoodState: HoodState
    public let kombiCurrentRemainingRangeFuel: String
    public let fuelPercent: String
    public let lastChargingEndReason: ChargingEndReason
    public let lastChargingEndResult: ChargingEndResult
    public let lastUpdateReason: UpdateReason
    public let lightsParking: LightsParking
    public let lscTrigger: LSCTrigger
    public let mileage: String
    public let prognosisWhileChargingStatus: PrognosisWhileCharging
    public let remainingFuel: String
    public let segmentLastTripRatioElectricDrivenDistance: String
    public let segmentLastTripTimeSegmentEnd: String
    public let segmentLastTripTimeSegmentEndFormatted: String
    public let segmentLastTripTimeSegmentEndFormattedDate: String
    public let segmentLastTripTimeSegmentEndFormattedTime: String
    public let shdStatusUnified: ShdStatusUnified
    public let singleImmediateCharging: SingleImmediateCharging
    public let socHVPercent: String
    public let sunroofPosition: String
    public let sunroofState: SunroofState
    public let trunkState: TrunkState
    public let unitOfCombustionConsumption: String
    public let unitOfElectricConsumption: String
    public let unitOfEnergy: String
    public let unitOfLength: String
    public let updateTime: String
    public let updateTimeConverted: String
    public let updateTimeConvertedDate: String
    public let updateTimeConvertedTime: String
    public let updateTimeConvertedTimestamp: String
    public let vehicleTracking: String
    public let windowDriverFront: WindowStatus
    public let windowDriverRear: WindowStatus
    public let windowPassengerFront: WindowStatus
    public let windowPassengerRear: WindowStatus

    public enum CodingKeys: String, CodingKey {
      case batterySizeMax = "battery_size_max"
      case beMaxRangeElectric
      case beMaxRangeElectricKm
      case beMaxRangeElectricMile
      case beRemainingRangeElectric
      case beRemainingRangeElectricKm
      case beRemainingRangeElectricMile
      case beRemainingRangeFuel
      case beRemainingRangeFuelKm
      case beRemainingRangeFuelMile
      case chargeNowAllowed
      case chargingConnectionType = "charging_connection_type"
      case chargingHVStatus
      case chargingInductivePositioning = "charging_inductive_positioning"
      case chargingLevelHv
      case chargingLogicCurrentlyActive
      case chargingStatus = "charging_status"
      case chargingSystemStatus
      case chargingTimeRemaining
      case checkControlMessages = "check_control_messages"
      case conditionBasedServices = "condition_based_services"
      case connectorStatus
      case dcsCCHActivation = "DCS_CCH_Activation"
      case dcsCCHOngoing = "DCS_CCH_Ongoing "
      case doorDriverFront = "door_driver_front"
      case doorDriverRear = "door_driver_rear"
      case doorLockState = "door_lock_state"
      case doorPassengerFront = "door_passenger_front"
      case doorPassengerRear = "door_passenger_rear"
      case gpsLat = "gps_lat"
      case gpsLng = "gps_lng"
      case heading
      case headUnit = "head_unit"
      case headUnitPUSoftware = "head_unit_pu_software"
      case hoodState = "hood_state"
      case kombiCurrentRemainingRangeFuel = "kombi_current_remaining_range_fuel"
      case fuelPercent
      case lastChargingEndResult
      case lastChargingEndReason
      case lastUpdateReason
      case lightsParking = "lights_parking"
      case lscTrigger = "lsc_trigger"
      case mileage
      case prognosisWhileChargingStatus
      case remainingFuel = "remaining_fuel"
      case segmentLastTripRatioElectricDrivenDistance = "Segment_LastTrip_ratio_electric_driven_distance"
      case segmentLastTripTimeSegmentEnd = "Segment_LastTrip_time_segment_end"
      case segmentLastTripTimeSegmentEndFormatted = "Segment_LastTrip_time_segment_end_formatted"
      case segmentLastTripTimeSegmentEndFormattedDate = "Segment_LastTrip_time_segment_end_formatted_date"
      case segmentLastTripTimeSegmentEndFormattedTime = "Segment_LastTrip_time_segment_end_formatted_time"
      case shdStatusUnified
      case singleImmediateCharging = "single_immediate_charging"
      case socHVPercent = "soc_hv_percent"
      case sunroofPosition = "sunroof_position"
      case sunroofState = "sunroof_state"
      case trunkState = "trunk_state"
      case unitOfCombustionConsumption
      case unitOfElectricConsumption
      case unitOfEnergy
      case unitOfLength
      case updateTime = "updateTime"
      case updateTimeConverted = "updateTime_converted"
      case updateTimeConvertedDate = "updateTime_converted_date"
      case updateTimeConvertedTime = "updateTime_converted_time"
      case updateTimeConvertedTimestamp = "updateTime_converted_timestamp"
      case vehicleTracking = "vehicle_tracking"
      case windowDriverFront = "window_driver_front"
      case windowDriverRear = "window_driver_rear"
      case windowPassengerFront = "window_passenger_front"
      case windowPassengerRear = "window_passenger_rear"
    }
  }

  public enum ChargeNowAllowed: String, Codable {
    case notAllowed = "NOT_ALLOWED"
  }
  public enum ChargingConnectionType: String, Codable {
    case conductive = "CONDUCTIVE"
  }
  public enum ChargingEndReason: String, Codable {
    case unknown = "UNKNOWN"
    case chargingGoalReached = "CHARGING_GOAL_REACHED"
  }
  public enum ChargingEndResult: String, Codable {
    case unknown = "UNKNOWN"
    case success = "SUCCESS"
  }
  public enum ChargingHVStatus: String, Codable {
    case charging = "CHARGING"
    case invalid = "INVALID"
  }
  public enum ChargingLogic: String, Codable {
    case directCharging = "DIRECT_CHARGING"
    case notCharging = "NOT_CHARGING"
  }
  public enum ChargingInductivePositioning: String, Codable {
    case notPositioned = "not_positioned"
  }
  public enum ChargingStatus: String, Codable {
    case chargingActive = "CHARGINGACTIVE"
    case noCharging = "NOCHARGING"
  }
  public enum ConnectorStatus: String, Codable {
    case connected = "CONNECTED"
    case disconnected = "DISCONNECTED"
  }
  public enum DoorLockState: String, Codable {
    case secured = "SECURED"
    case unlocked = "UNLOCKED"
    case selectiveLocked = "SELECTIVELOCKED"
  }
  public enum DoorStatus: String, Codable {
    case closed = "CLOSED"
  }
  public enum HeadUnit: String, Codable {
    case nbt = "NBT"
  }
  public enum HoodState: String, Codable {
    case closed = "CLOSED"
  }
  public enum LightsParking: String, Codable {
    case off = "OFF"
  }
  public enum LSCTrigger: String, Codable {
    case chargingStarted = "CHARGINGSTARTED"
    case vehicleShutdownSecured = "VEHCSHUTDOWN_SECURED"
  }
  public enum OpenCloseState: String, Codable {
    case closed = "CLOSED"
  }
  public enum PrognosisWhileCharging: String, Codable {
    case isPerformed = "IS_PERFORMED"
    case notNeeded = "NOT_NEEDED"
  }
  public enum ShdStatusUnified: String, Codable {
    case closed = "CLOSED"
  }
  public enum SingleImmediateCharging: String, Codable {
    case isUnused
  }
  public enum SunroofState: String, Codable {
    case closed = "CLOSED"
    case open = "OPEN"
  }
  public enum TrunkState: String, Codable {
    case closed = "CLOSED"
  }
  public enum WindowStatus: String, Codable {
    case closed = "CLOSED"
  }
  public enum UpdateReason: String, Codable {
    case chargingStarted = "CHARGINGSTARTED"
    case vehicleShutdownSecured = "VEHCSHUTDOWN_SECURED"
  }
}
