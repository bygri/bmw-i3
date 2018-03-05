public enum OddBool: String, Codable {
  case `true` = "IS_TRUE"
}

public struct ChargingProfile: Codable {
  public let pendingUpdate: Bool
  public let weekTimer: WeekTimer
  public let xmlVersion: XMLVersion

  public struct XMLVersion: Codable {
    public let major: Int
    public let minor: Int
  }

  public struct WeekTimer: Codable {
    public let chargingPreference: ChargingPreference
    public let climatisationOn: OddBool
    public let departureTimes: DepartureTimes
    public let immediateCharging: OddBool
    public let reductionOfChargeCurrent: ReductionOfChargeCurrent

    public struct DepartureTimes: Codable {
      public let departureTimeLong: [DepartureTimeLong]

      public struct DepartureTimeLong: Codable {
        public let departureTime: Time
        public let timerActive: TimerActive
        public let weekdays: Weekdays

        public struct Weekdays: Codable {
          let weekday: [Weekday]
        }
      }
    }

    public struct ReductionOfChargeCurrent: Codable {
      let start: Time
      let end: Time
    }

    public struct Time: Codable {
      let hours: Int
      let minutes: Int
    }
  }

  public enum ChargingPreference: String, Codable {
    case chargingWindow = "CHARGING_WINDOW"
  }
  public enum TimerActive: String, Codable {
    case activate = "ACTIVATE"
    case deactivate = "DEACTIVATE"
  }
  public enum Weekday: String, Codable {
    case monday = "MONDAY"
    case tuesday = "TUESDAY"
    case wednesday = "WEDNESDAY"
    case thursday = "THURSDAY"
    case friday = "FRIDAY"
    case saturday = "SATURDAY"
    case sunday = "SUNDAY"
  }
}
