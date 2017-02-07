//
//  SampleProjectTests.swift
//  SampleProjectTests
//
//  Created by danube83 on 2017. 1. 31..
//  Copyright © 2017년 danube83. All rights reserved.
//

import XCTest

@testable import SampleProject

class HomeTests: XCTestCase {
    let presenter = HomePresenter()
    let tableView = UITableView()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tableView.register(TopFreeApplicationTableViewCell.self)
        presenter.viewControllerDidLoad()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let countOfItem = self.presenter.countOfItem()
            XCTAssert(countOfItem > 0)
        }
    }
    
    func testMakeCell() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let cell = self.presenter.cell(at: IndexPath(row: 0, section: 0), of: self.tableView)
            XCTAssertNil(cell)
        }
    }
    
}
