import Vapor

public final class Provider: Vapor.Provider {

  public static let repositoryName = "i3"

  public convenience init(config: Config) throws {
    self.init()
  }

  init() {}

  public func boot(_ config: Config) throws {}

  public func boot(_ drop: Droplet) throws {
  }

  public func beforeRun(_ drop: Droplet) throws {}

}