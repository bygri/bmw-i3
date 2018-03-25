import Foundation

extension DynamicResponse {
  public struct AttributesMap: Codable {
    public let batterySizeMax: Int
    public let beMaxRangeElectric: Double
    public let beMaxRangeElectricKm: Double
    public let beMaxRangeElectricMile: Double
    public let beRemainingRangeElectric: Double
    public let beRemainingRangeElectricKm: Double
    public let beRemainingRangeElectricMile: Double
    public let beRemainingRangeFuel: Double
    public let beRemainingRangeFuelKm: Double
    public let beRemainingRangeFuelMile: Double
    public let chargeNowAllowed: ChargeNowAllowed
    public let chargingConnectionType: ChargingConnectionType
    public let chargingHVStatus: ChargingHVStatus
    public let chargingInductivePositioning: ChargingInductivePositioning
    public let chargingLevelHv: Double
    public let chargingLogicCurrentlyActive: ChargingLogic
    public let chargingStatus: ChargingStatus
    public let chargingSystemStatus: ChargingStatus
    public let chargingTimeRemaining: Double?
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
    public let fuelPercent: Int
    public let gpsLat: Double
    public let gpsLng: Double
    public let heading: Int
    public let headUnit: HeadUnit
    public let headUnitPUSoftware: String
    public let hoodState: HoodState
    public let kombiCurrentRemainingRangeFuel: Double
    public let lastChargingEndReason: ChargingEndReason
    public let lastChargingEndResult: ChargingEndResult
    public let lastUpdateReason: UpdateReason
    public let lightsParking: LightsParking
    public let lscTrigger: UpdateReason
    public let mileage: Int
    public let prognosisWhileChargingStatus: PrognosisWhileCharging
    public let remainingFuel: Int
    public let segmentLastTripRatioElectricDrivenDistance: Int
    public let segmentLastTripTimeSegmentEnd: String
    public let segmentLastTripTimeSegmentEndFormatted: String
    public let segmentLastTripTimeSegmentEndFormattedDate: String
    public let segmentLastTripTimeSegmentEndFormattedTime: String
    public let shdStatusUnified: ShdStatusUnified
    public let singleImmediateCharging: SingleImmediateCharging
    public let socHVPercent: Double
    public let sunroofPosition: Int
    public let sunroofState: SunroofState
    public let trunkState: TrunkState
    public let unitOfCombustionConsumption: String
    public let unitOfElectricConsumption: String
    public let unitOfEnergy: String
    public let unitOfLength: String
    public let updateTime: Date
    public let updateTimeConverted: String
    public let updateTimeConvertedDate: String
    public let updateTimeConvertedTime: String
    public let updateTimeConvertedTimestamp: Int
    public let vehicleTracking: Int
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
      case fuelPercent
      case gpsLat = "gps_lat"
      case gpsLng = "gps_lng"
      case heading
      case headUnit = "head_unit"
      case headUnitPUSoftware = "head_unit_pu_software"
      case hoodState = "hood_state"
      case kombiCurrentRemainingRangeFuel = "kombi_current_remaining_range_fuel"
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

    public init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      batterySizeMax = try unwrapInt(from: values.decode(String.self, forKey: .batterySizeMax))
      beMaxRangeElectric = try unwrapDouble(from: values.decode(String.self, forKey: .beMaxRangeElectric))
      beMaxRangeElectricKm = try unwrapDouble(from: values.decode(String.self, forKey: .beMaxRangeElectricKm))
      beMaxRangeElectricMile = try unwrapDouble(from: values.decode(String.self, forKey: .beMaxRangeElectricMile))
      beRemainingRangeElectric = try unwrapDouble(from: values.decode(String.self, forKey: .beRemainingRangeElectric))
      beRemainingRangeElectricKm = try unwrapDouble(from: values.decode(String.self, forKey: .beRemainingRangeElectricKm))
      beRemainingRangeElectricMile = try unwrapDouble(from: values.decode(String.self, forKey: .beRemainingRangeElectricMile))
      beRemainingRangeFuel = try unwrapDouble(from: values.decode(String.self, forKey: .beRemainingRangeFuel))
      beRemainingRangeFuelKm = try unwrapDouble(from: values.decode(String.self, forKey: .beRemainingRangeFuelKm))
      beRemainingRangeFuelMile = try unwrapDouble(from: values.decode(String.self, forKey: .beRemainingRangeFuelMile))
      chargeNowAllowed = try values.decode(ChargeNowAllowed.self, forKey: .chargeNowAllowed)
      chargingConnectionType = try values.decode(ChargingConnectionType.self, forKey: .chargingConnectionType)
      chargingHVStatus = try values.decode(ChargingHVStatus.self, forKey: .chargingHVStatus)
      chargingInductivePositioning = try values.decode(ChargingInductivePositioning.self, forKey: .chargingInductivePositioning)
      chargingLevelHv = try unwrapDouble(from: values.decode(String.self, forKey: .chargingLevelHv))
      chargingLogicCurrentlyActive = try values.decode(ChargingLogic.self, forKey: .chargingLogicCurrentlyActive)
      chargingStatus = try values.decode(ChargingStatus.self, forKey: .chargingStatus)
      chargingSystemStatus = try values.decode(ChargingStatus.self, forKey: .chargingSystemStatus)
      chargingTimeRemaining = try unwrapDoubleIfPresent(from: values.decodeIfPresent(String.self, forKey: .chargingTimeRemaining))
      checkControlMessages = try values.decode(String.self, forKey: .checkControlMessages)
      conditionBasedServices = try values.decode(String.self, forKey: .conditionBasedServices)
      connectorStatus = try values.decode(ConnectorStatus.self, forKey: .connectorStatus)
      dcsCCHActivation = try values.decodeIfPresent(String.self, forKey: .dcsCCHActivation)
      dcsCCHOngoing = try values.decodeIfPresent(String.self, forKey: .dcsCCHOngoing)
      doorDriverFront = try values.decode(DoorStatus.self, forKey: .doorDriverFront)
      doorDriverRear = try values.decode(DoorStatus.self, forKey: .doorDriverRear)
      doorLockState = try values.decode(DoorLockState.self, forKey: .doorLockState)
      doorPassengerFront = try values.decode(OpenCloseState.self, forKey: .doorPassengerFront)
      doorPassengerRear = try values.decode(DoorStatus.self, forKey: .doorPassengerRear)
      fuelPercent = try unwrapInt(from: values.decode(String.self, forKey: .fuelPercent))
      gpsLat = try unwrapDouble(from: values.decode(String.self, forKey: .gpsLat))
      gpsLng = try unwrapDouble(from: values.decode(String.self, forKey: .gpsLng))
      heading = try unwrapInt(from: values.decode(String.self, forKey: .heading))
      headUnit = try values.decode(HeadUnit.self, forKey: .headUnit)
      headUnitPUSoftware = try values.decode(String.self, forKey: .headUnitPUSoftware)
      hoodState = try values.decode(HoodState.self, forKey: .hoodState)
      kombiCurrentRemainingRangeFuel = try unwrapDouble(from: values.decode(String.self, forKey: .kombiCurrentRemainingRangeFuel))
      lastChargingEndReason = try values.decode(ChargingEndReason.self, forKey: .lastChargingEndReason)
      lastChargingEndResult = try values.decode(ChargingEndResult.self, forKey: .lastChargingEndResult)
      lastUpdateReason = try values.decode(UpdateReason.self, forKey: .lastUpdateReason)
      lightsParking = try values.decode(LightsParking.self, forKey: .lightsParking)
      lscTrigger = try values.decode(UpdateReason.self, forKey: .lscTrigger)
      mileage = try unwrapInt(from: values.decode(String.self, forKey: .mileage))
      prognosisWhileChargingStatus = try values.decode(PrognosisWhileCharging.self, forKey: .prognosisWhileChargingStatus)
      remainingFuel = try unwrapInt(from: values.decode(String.self, forKey: .remainingFuel))
      segmentLastTripRatioElectricDrivenDistance = try unwrapInt(from: values.decode(String.self, forKey: .segmentLastTripRatioElectricDrivenDistance))
      segmentLastTripTimeSegmentEnd = try values.decode(String.self, forKey: .segmentLastTripTimeSegmentEnd)
      segmentLastTripTimeSegmentEndFormatted = try values.decode(String.self, forKey: .segmentLastTripTimeSegmentEndFormatted)
      segmentLastTripTimeSegmentEndFormattedDate = try values.decode(String.self, forKey: .segmentLastTripTimeSegmentEndFormattedDate)
      segmentLastTripTimeSegmentEndFormattedTime = try values.decode(String.self, forKey: .segmentLastTripTimeSegmentEndFormattedTime)
      shdStatusUnified = try values.decode(ShdStatusUnified.self, forKey: .shdStatusUnified)
      singleImmediateCharging = try values.decode(SingleImmediateCharging.self, forKey: .singleImmediateCharging)
      socHVPercent = try unwrapDouble(from: values.decode(String.self, forKey: .socHVPercent))
      sunroofPosition = try unwrapInt(from: values.decode(String.self, forKey: .sunroofPosition))
      sunroofState = try values.decode(SunroofState.self, forKey: .sunroofState)
      trunkState = try values.decode(TrunkState.self, forKey: .trunkState)
      unitOfCombustionConsumption = try values.decode(String.self, forKey: .unitOfCombustionConsumption)
      unitOfElectricConsumption = try values.decode(String.self, forKey: .unitOfElectricConsumption)
      unitOfEnergy = try values.decode(String.self, forKey: .unitOfEnergy)
      unitOfLength = try values.decode(String.self, forKey: .unitOfLength)
      /* 04.03.2018 20:49:59 UTC */
      updateTime = try unwrapDate(from: values.decode(String.self, forKey: .updateTime), format: "dd.MM.yyyy HH:mm:ss zzz")
      updateTimeConverted = try values.decode(String.self, forKey: .updateTimeConverted)
      updateTimeConvertedDate = try values.decode(String.self, forKey: .updateTimeConvertedDate)
      updateTimeConvertedTime = try values.decode(String.self, forKey: .updateTimeConvertedTime)
      updateTimeConvertedTimestamp = try unwrapInt(from: values.decode(String.self, forKey: .updateTimeConvertedTimestamp))
      vehicleTracking = try unwrapInt(from: values.decode(String.self, forKey: .vehicleTracking))
      windowDriverFront = try values.decode(WindowStatus.self, forKey: .windowDriverFront)
      windowDriverRear = try values.decode(WindowStatus.self, forKey: .windowDriverRear)
      windowPassengerFront = try values.decode(WindowStatus.self, forKey: .windowPassengerFront)
      windowPassengerRear = try values.decode(WindowStatus.self, forKey: .windowPassengerRear)
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
    case connectorRemoved = "CONNECTOR_REMOVED"
    case endRequestedByDriver = "END_REQUESTED_BY_DRIVER"
    case powergridFailed = "POWERGRID_FAILED"
  }
  public enum ChargingEndResult: String, Codable {
    case failed = "FAILED"
    case success = "SUCCESS"
    case unknown = "UNKNOWN"
  }
  public enum ChargingHVStatus: String, Codable {
    case charging = "CHARGING"
    case error = "ERROR"
    case finishedFullyCharged = "FINISHED_FULLY_CHARGED"
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
    case chargingEnded = "CHARGINGENDED"
    case chargingError = "CHARGINGERROR"
    case noCharging = "NOCHARGING"
  }
  public enum ConnectorStatus: String, Codable {
    case connected = "CONNECTED"
    case disconnected = "DISCONNECTED"
  }
  public enum DoorLockState: String, Codable {
    case locked = "LOCKED"
    case secured = "SECURED"
    case unlocked = "UNLOCKED"
    case selectiveLocked = "SELECTIVELOCKED"
  }
  public enum DoorStatus: String, Codable {
    case closed = "CLOSED"
    case open = "OPEN"
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
  public enum OpenCloseState: String, Codable {
    case closed = "CLOSED"
    case open = "OPEN"
  }
  public enum PrognosisWhileCharging: String, Codable {
    case isPerformed = "IS_PERFORMED"
    case notNeeded = "NOT_NEEDED"
  }
  public enum ShdStatusUnified: String, Codable {
    case closed = "CLOSED"
    case invalid = "INVALID"
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
    case open = "OPEN"
  }
  public enum WindowStatus: String, Codable {
    case closed = "CLOSED"
    case intermediate = "INTERMEDIATE"
    case invalid = "INVALID"
    case open = "OPEN"
  }
  public enum UpdateReason: String, Codable {
    case chargingDone = "CHARGINGDONE"
    case chargingInterrupted = "CHARGINGINTERRUPTED"
    case chargingStarted = "CHARGINGSTARTED"
    case doorStateChanged = "DOORSTATECHANGED"
    case predictionUpdate = "PREDICTIONUPDATE"
    case vehicleMoving = "VEHICLE_MOVING"
    case vehicleSecured = "VEHICLE_SECURED"
    case vehicleShutdownSecured = "VEHCSHUTDOWN_SECURED"
  }
}

private func unwrapInt(from string: String) throws -> Int {
  guard let unwrapped = Int(string) else {
    throw ConnectedDriveError.invalidConversion
  }
  return unwrapped
}
private func unwrapIntIfPresent(from string: String?) throws -> Int? {
  guard let string = string else { return nil }
  guard let unwrapped = Int(string) else {
    throw ConnectedDriveError.invalidConversion
  }
  return unwrapped
}

private func unwrapDouble(from string: String) throws -> Double {
  guard let unwrapped = Double(string) else {
    throw ConnectedDriveError.invalidConversion
  }
  return unwrapped
}
private func unwrapDoubleIfPresent(from string: String?) throws -> Double? {
  guard let string = string else { return nil }
  guard let unwrapped = Double(string) else {
    throw ConnectedDriveError.invalidConversion
  }
  return unwrapped
}

private let dateFormatter = DateFormatter()
private func unwrapDate(from string: String, format: String) throws -> Date {
  dateFormatter.dateFormat =  format
  guard let unwrapped = dateFormatter.date(from: string) else {
    throw ConnectedDriveError.invalidConversion
  }
  return unwrapped
}
