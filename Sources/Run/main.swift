import FluentProvider
import i3
import MySQLProvider
import Vapor

let config = try Config()

try config.addProvider(MySQLProvider.Provider.self)
try config.addProvider(i3.Provider.self)

config.preparations.append(FluentCache.CacheEntity.self)

let drop = try Droplet(config)
try drop.run()
