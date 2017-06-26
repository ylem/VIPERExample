//
//  WLFruitListWorkerTest.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest
@testable import FruitApp

class WLFruitListWorkerSpy: WLFruitListWorker {

    var isStartRetrieveFruitsCalled = false

    override func startRetrieveFruits() {
        isStartRetrieveFruitsCalled = true
    }
}

class WLFruitListWorkerTest: XCTestCase {

    let worker = WLFruitListWorkerSpy()
    var mockData: JSON?

    override func setUp() {
        super.setUp()

        let testBundle = Bundle(for: type(of: self))
        if let url = testBundle.url(forResource: "mock_list_data", withExtension: "json") {
            do {
                if let data = try? Data(contentsOf: url) {
                    mockData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON
                    return
                }
                assertionFailure( "load local mock_list_data failed")
            } catch {
                assertionFailure("load or parse local mock_list_data failed")
            }
        }

        assertionFailure( "cannnot find local mock_list_data.json")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCalledStartRetrieveFruits() {
        worker.startRetrieveFruits()
        XCTAssertTrue(worker.isStartRetrieveFruitsCalled)
    }
    
    func testParseFruits() {
        let fruits = WLFruitListWorker().parseResponse(from: mockData!)
        XCTAssert(fruits?.count == 9)

        if let apple = fruits?.first?.type {
            XCTAssert(apple == "apple", "first fruit should be apple")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
