//
//  WLDetailWirFrameTests.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLDetailWireFrameTests: XCTestCase {
    let testFruit = WLFruit(type: "apple", price: "0", weight: "0")
    let testObj   = WLFruitDetailWireFrame()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProtocolsConnection() {
        let testVC = WLFruitDetailWireFrame.createFruitDetailModule(for: testFruit)
        
        if let testVC = testVC as? WLFruitDetailViewController {
            XCTAssertTrue(testVC.presenter.self is WLFruitDetailPresenter)
            XCTAssertTrue(testVC.presenter?.view.self is WLFruitDetailViewController)
            XCTAssertTrue(testVC.presenter?.wireFrame is WLFruitDetailWireFrame)
        } else {
            XCTAssertTrue(false)
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
