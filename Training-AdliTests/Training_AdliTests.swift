//
//  Training_AdliTests.swift
//  Training-AdliTests
//
//  Created by Adli Raihan on 11/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import XCTest
@testable import Training_Adli

var dashboard : DashboardViewController!
class Training_AdliTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        dashboard = DashboardViewController()
        dashboard.interactor?.getAllPhotos()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dashboard = nil
        super.tearDown()
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

}
