//
//  WLStatWorkerTests.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLStatWorkerSpy: WLStatWorker {
    var loadEntity: WLStatEntity {
        return self.entity(event: WLStatEvent.kStatLoad,
                             dataType: WLStatDataType.doubleWithoutDecimalData(100.0))!
    }

    var displayEntity: WLStatEntity {
        return self.entity(event: WLStatEvent.kStatDisplay,
                           dataType: WLStatDataType.doubleWithoutDecimalData(100.123))!
    }

    var errorEntity: WLStatEntity {
        return self.entity(event: WLStatEvent.kStatError,
                           dataType: WLStatDataType.strData("error space error"))!
    }
}

class WLStatWorkerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLoadEntity() {
        let entity = WLStatWorkerSpy().loadEntity
        XCTAssertEqual(entity.event == "load", entity.data == "100")
    }

    func testDispalyEntity() {
        let entity = WLStatWorkerSpy().displayEntity
        XCTAssertEqual(entity.event == "display", entity.data == "100")
    }

    func testErrorEntity() {
        let entity = WLStatWorkerSpy().errorEntity
        XCTAssertEqual(entity.event == "error", entity.data == "error%20space%20error")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
