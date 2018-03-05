public struct Navigation: Codable {
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
