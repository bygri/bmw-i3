import Vapor

public final class Provider: Vapor.Provider {

  public static let repositoryName = "i3"

  public convenience init(config: Config) throws {
    self.init()
  }

  init() {}

  public func boot(_ config: Config) throws {
    config.preparations.append(SourceFile.SourceFileMigration1.self)
    config.preparations.append(Datum.DatumMigration1.self)
    config.addConfigurable(command: Fetch.init, name: "fetch")
    config.addConfigurable(command: Parse.init, name: "parse")
  }

  public func boot(_ drop: Droplet) throws {
    SourceFile.database = drop.database
    Datum.database = drop.database
  }

  public func beforeRun(_ drop: Droplet) throws {}

}
