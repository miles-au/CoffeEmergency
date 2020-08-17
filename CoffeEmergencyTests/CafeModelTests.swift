//
//  CafeModelTests.swift
//  CoffeEmergencyTests
//
//  Created by Miles Au on 2020-08-16.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import XCTest
@testable import CoffeEmergency

class CafeModelTests: XCTestCase {
    
    /// Test data received from api is properly parsed into cafe models
    func testInitializationFromCafeData() {
        let expectedCafeModel = CoffeEmergencyTestsTestData.firstCafeModel
        let createdCafeModel = CafeModel.from(cafeData: CoffeEmergencyTestsTestData.firstCafeData)
        XCTAssertEqual(expectedCafeModel, createdCafeModel, "CafeModel created from CafeData is incorrect values.")
    }

}
