#if os(Linux)

import XCTest
@testable import ConnectedDriveTests

XCTMain([
  testCase(ChargingProfileTests.allTests),
  testCase(DynamicTests.allTests),
  testCase(NavigationTests.allTests)
])

#endif
