import Cache
import ConnectedDrive
import Console
import Foundation
import HTTP
import Vapor

/**
Downloads the latest dynamic.json file from ConnectedDrive, checks that it contains new data,
and if so, stores it as a RawRecord.
*/
final class Fetch: Command, ConfigInitializable {
  let id = "fetch"
  let help = ["Fetches ConnectedDrive info."]
  let cache: CacheProtocol
  let client: ClientFactoryProtocol
  let console: ConsoleProtocol
  let log: LogProtocol

  let host: String
  let username: String
  let password: String
  let vin: String

  init(config: Config) throws {
    cache = try config.resolveCache()
    client = try config.resolveClient()
    console = try config.resolveConsole()
    log = try config.resolveLog()
    guard let cfg = config["connecteddrive"] else {
      throw ConfigError.missingFile("connecteddrive")
    }
    guard let host = cfg["host"]?.string else {
      throw ConfigError.missing(key: ["host"], file: "connecteddrive", desiredType: String.self)
    }
    guard let username = cfg["username"]?.string else {
      throw ConfigError.missing(key: ["username"], file: "connecteddrive", desiredType: String.self)
    }
    guard let password = cfg["password"]?.string else {
      throw ConfigError.missing(key: ["password"], file: "connecteddrive", desiredType: String.self)
    }
    guard let vin = cfg["vin"]?.string else {
      throw ConfigError.missing(key: ["vin"], file: "connecteddrive", desiredType: String.self)
    }
    self.host = host
    self.username = username
    self.password = password
    self.vin = vin
  }

  func run(arguments: [String]) throws  {
    log.info("Starting Fetch.")
    // Load token from cache, or attempt to log in.
    let token = try cache.get("token")?.string ?? login()
    // Fetch Dynamic data fom CD.
    let request = Request(
      method: .get,
      uri: host + DynamicRequest.url(for: vin),
      headers: ["Authorization": "Bearer \(token)"])
    let response = try client.respond(to: request)
    guard let bytes = response.body.bytes else {
      log.error("Bad response from ConnectedDrive: \(response)")
      return
    }
    // Save the raw response, or discard if identical to the previous record.
    let record = RawRecord(data: bytes)
    let lastRecord = try RawRecord.makeQuery().sort("id", .descending).first()
    if lastRecord?.checksum == record.checksum {
      log.info("Discarding no-change raw record.")
    } else {
      try record.save()
      log.info("New raw record saved with checksum \(record.checksum).")
    }
    log.info("Fetch completed.")
  }

  // Log in, cache and return token.
  private func login() throws -> String {
    log.info("Getting a new authentication token from ConnectedDrive.")
    let request = Request(method: .post, uri: "https://customer.bmwgroup.com/gcdm/oauth/authenticate")
    request.formURLEncoded = try [
      "client_id": "dbf0a542-ebd1-4ff0-a9a7-55172fbfce35",
      "redirect_uri": "https://www.bmw-connecteddrive.com/app/default/static/external-dispatch.html",
      "response_type": "token",
      "scope": "authenticate_user fupo",
      "username": username,
      "password": password,
    ].makeNode(in: nil)
    let response = try client.respond(to: request)
    guard
      let locationHeader = response.headers[HeaderKey.location],
      let fragment = try URI(locationHeader).fragment
    else {
      log.error("The ConnectedDrive server returned an unexpected response: \(response)")
      throw Abort.serverError
    }
    // The fragment should be a URL-encoded string with access_token, token_type, and expires_in
    let result = fragment
      .components(separatedBy: "&")
      .map { $0.components(separatedBy: "=") }
      .reduce([:] as [String: String]) { acc, next in
        var ret = acc
        ret[next[0]] = next[1]
        return ret
      }
    guard
      result["token_type"] == "Bearer",
      let tokenString = result["access_token"],
      let expiresInString = result["expires_in"],
      let expiresIn = Double(expiresInString)
    else {
      log.error("The ConnectedDrive server returned an unexpected response. Fragment: \(fragment)")
      throw Abort.serverError
    }
    try cache.set("token", tokenString, expiration: Date() + expiresIn)
    return tokenString
  }
}
