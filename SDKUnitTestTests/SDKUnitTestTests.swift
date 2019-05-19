//
//  SDKUnitTestTests.swift
//  SDKUnitTestTests
//
//  Created by 近藤 寛志 on 2019/05/19.
//  Copyright © 2019 iret, Inc. All rights reserved.
//

import XCTest
@testable import SDKUnitTest

class SDKUnitTestTests: XCTestCase {
    private let viewController = ViewController()
    private let urlField = UITextField()
    private let failedLabel = UILabel()

    override func setUp() {
        viewController.urlField = urlField
        viewController.failedLabel = failedLabel
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOpenUrl() {
        let mock = UIApplicationMock()
        mock.stubbedCanOpenURLResult = true
        viewController.open(urlString: "hogehoge", application: mock)
        
        XCTAssertTrue(mock.invokedCanOpenURL)
        XCTAssertTrue(mock.invokedOpen)
    }
    
    func testOpenUrlFailed() {
        let mock = UIApplicationMock()
        mock.stubbedCanOpenURLResult = false
        viewController.open(urlString: "hogehoge", application: mock)

        XCTAssertTrue(mock.invokedCanOpenURL)
        XCTAssertFalse(mock.invokedOpen)
    }
    
    func testOpenUrlEmptyString() {
        let mock = UIApplicationMock()
        mock.stubbedCanOpenURLResult = false
        viewController.open(urlString: "", application: mock)
        
        XCTAssertFalse(mock.invokedCanOpenURL)
        XCTAssertFalse(mock.invokedOpen)
    }

}
