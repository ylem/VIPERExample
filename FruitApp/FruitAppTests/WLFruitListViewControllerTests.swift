//
//  WLFruitListViewControllerTests.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLFruitListViewControllerTests: XCTestCase {

    let testVC = WLFruitListWireFrame.createFruitListModule()
    let presenter = WLFruitListPresenterSpy()
    
    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func loadView() {
        guard let testVC = testVC as? WLFruitListViewController else{
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
