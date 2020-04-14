//
//  Singleton_iOSTests.swift
//  Singleton-iOSTests
//
//  Created by Saeed on 4/14/20.
//  Copyright © 2020 Aquila. All rights reserved.
//

import XCTest
@testable import Singleton_iOS

class Singleton_iOSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testConcurrentUsage() {
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        
        let expect = expectation(description: "Using AppConfig.shared from multiple threads")
        
        let callCount = 100
        
        for callIndex in 1...callCount {
            concurrentQueue.async {
                AppConfig.shared.set(value: callIndex, forKey: String(callIndex))
            }
        }
        
        while AppConfig.shared.int(forKey: String(callCount)) != callCount {
            // nop
        }
        
        expect.fulfill()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Test expectation failed")
        }
    }
}
