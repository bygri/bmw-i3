public struct Navigation: Codable {
  public static func url(for vin: String) -> String {
    return "/api/vehicle/navigation/v1/\(vin)"
  }

  public let auxPowerEcoPro: Double
  public let auxPowerEcoProPlus: Double
  public let auxPowerRegular: Double
  public let isoCountryCode: String
  public let latitude: Double
  public let longitude: Double
  public let pendingUpdate: Bool
  public let soc: Double
  public let socMax: Double
  public let vehicleTracking: Bool
}
