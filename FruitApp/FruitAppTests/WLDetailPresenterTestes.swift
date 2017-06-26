//
//  WLDetailPresenterTestes.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLFruitDetailPresenterSpy: WLFruitDetailPresenter {

    var isCalledViewDidLoad = false
    
    override func viewDidLoad() {
        isCalledViewDidLoad = true
    }
}

class WLDetailPresenterTestes: XCTestCase {

    let testObj = WLFruitDetailPresenterSpy()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalledViewDidLoad() {
        testObj.viewDidLoad()
        XCTAssertTrue(testObj.isCalledViewDidLoad)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
