//
//  WLFruitListPresenterTests.swift
//  FruitApp
//
//  Created by Wei Lu on 24/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import XCTest

@testable import FruitApp

class WLFruitListPresenterSpy: WLFruitListPresenter {
    var isCalledViewDidLoad     = false
    var isCalledShowDetailPage  = false
    var isCalledRefreshListData = false

    let interacterSpy = WLFruitListInteractorSpy()
    let wireFrameSpy  = WLFruitListWireFrameSpy()

    override func viewDidLoad() {
        isCalledViewDidLoad = true
        interacterSpy.startFetchFruits()
    }

    override func showDetailPage(fruit: WLFruit?) {
        isCalledShowDetailPage = true
        wireFrameSpy.go2DetailScreen(from: nil, fruit: nil)
    }

    override func refreshListData() {
        isCalledRefreshListData = true
        interacterSpy.startFetchFruits()
    }
}


class WLFruitListPresenterTests: XCTestCase {

    let testObj       = WLFruitListPresenterSpy()
    let interacterSpy = WLFruitListInteractorSpy()

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
        XCTAssertTrue(testObj.interacterSpy.isStartFetchFruits)
    }

    func testCalledShowDetailPage() {
        testObj.showDetailPage(fruit: nil)
        XCTAssertTrue(testObj.wireFrameSpy.isCalledGo2DetailScreen)
    }

    func testCalledRefreshListData() {
        testObj.refreshListData()
        XCTAssertTrue(testObj.interacterSpy.isStartFetchFruits)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
