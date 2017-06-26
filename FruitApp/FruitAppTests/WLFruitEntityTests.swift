//
//  WLFruitEntityTests.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLFruitEntityTests: XCTestCase {

    let json: JSON            = ["type": "apple", "price": 120, "weight": 80]
    let unknownTypejson: JSON = ["type": "unknown", "price": 120, "weight": 80]

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWLFruitEntityLoadFromJSON() {
        let fruit = WLFruit(json: json)
        XCTAssertTrue(fruit?.type == "apple")
        XCTAssertTrue(fruit?.price == "120")
        XCTAssertTrue(fruit?.weight == "80")
    }

    func testWLFruitViewModel() {
        let fruit     = WLFruit(json: json)
        let viewModel = WLFruitViewModel(fruit: fruit)

        XCTAssertTrue(viewModel?.typeStr == "apple")
        XCTAssertTrue(viewModel?.priceStr == "1.20")
        XCTAssertTrue(viewModel?.weightStr == "0.08")
    }

    func testUnknownTypeFruitViewModel() {
        let fruit     = WLFruit(json: unknownTypejson)
        let viewModel = WLFruitViewModel(fruit: fruit)

        XCTAssertNotNil(viewModel?.typeImg)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
