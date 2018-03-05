public struct Dynamic: Codable {
  public let attributesMap: AttributesMap
  public let vehicleMessages: VehicleMessages

  public struct VehicleMessages: Codable {
    public let ccmMessages: [VehicleMessage]
    public let cbsMessages: [VehicleMessage]

    public struct VehicleMessage: Codable {
      public let description: String
      public let text: String
      public let id: Int
      public let status: Status
      public let messageType: MessageType
      public let date: String
    }
  }

  public enum Status: String, Codable {
    case ok = "OK"
  }
  public enum MessageType: String, Codable {
    case cbs = "CBS"
  }
}
