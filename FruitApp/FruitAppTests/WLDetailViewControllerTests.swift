//
//  WLDetailViewControllerTests.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLDetailViewControllerTests: XCTestCase {
    let testFruit = WLFruit(type: "apple", price: "0", weight: "0")
    let presenter = WLFruitDetailPresenterSpy()

    var testVC: WLFruitDetailViewController?

    override func setUp() {
        super.setUp()

        testVC = WLFruitDetailWireFrame.createFruitDetailModule(for: testFruit) as? WLFruitDetailViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

    func loadView() {
        XCTAssertNotNil(testVC)

        guard let testVC = testVC else {
            return
        }

        testVC.presenter = presenter

        UIWindow().addSubview(testVC.view)
        RunLoop.current.run(until: Date())
    }

    func testShouldCallPresenter() {
        loadView()
        XCTAssert(presenter.isCalledViewDidLoad)
    }
}
