//
//  CafeManagerTests.swift
//  CoffeEmergencyTests
//
//  Created by Miles Au on 2020-08-16.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import XCTest
@testable import CoffeEmergency

class CafeManagerTests: XCTestCase {
    
    var sut: CafeManager!
    
    fileprivate var testJsonData = Data(CoffeEmergencyTestsTestData.tempJSONString.utf8)
    
    override func setUp() {
        super.setUp()
        sut = CafeManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    /// Test data received from api is properly parsed into cafe models
    func testParseJsonData() {
        print(CoffeEmergencyTestsTestData.tempJSONString)
        let goodResponse = sut.parse(json: Data(CoffeEmergencyTestsTestData.tempJSONString.utf8))
        switch goodResponse{
            case .success(let cafes):
                XCTAssertEqual(cafes.count, 5, "Number of models parsed does not match number of objects in data")
                XCTAssertEqual(cafes.first, CoffeEmergencyTestsTestData.firstCafeModel, "First model does not match values of first object in data.")
            case .failure(_):
                XCTFail("Parse result failed.")
        }
    }    
}
