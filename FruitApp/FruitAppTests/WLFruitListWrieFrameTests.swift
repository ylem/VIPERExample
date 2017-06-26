//
//  WLFruitListWrieFrameTests.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLFruitListWireFrameSpy: WLFruitListWireFrame {

    var isCalledGo2DetailScreen = false

    override func go2DetailScreen(from: WLFruitListViewProtocol?, fruit: WLFruit?) {
        isCalledGo2DetailScreen = true
    }

}

class WLFruitListWrieFrameTests: XCTestCase {

    let testObj = WLFruitListWireFrame()
    let testVC  = WLFruitListWireFrame.createFruitListModule()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProtocolsConnection() {
        if let testVC = testVC as? WLFruitListViewController {
            XCTAssertTrue(testVC.presenter.self is WLFruitListPresenter)
            XCTAssertTrue(testVC.presenter?.interactor.self is WLFruitListInteractor)
            XCTAssertTrue(testVC.presenter?.view.self is WLFruitListViewController)
            XCTAssertTrue(testVC.presenter?.wireFrame is WLFruitListWireFrame)
            XCTAssertTrue(testVC.presenter?.interactor?.presenter is WLFruitListPresenter)
            XCTAssertTrue(testVC.presenter?.interactor?.statwork is WLStatWorker)
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
