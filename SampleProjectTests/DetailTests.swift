//
//  DetailTests.swift
//  SampleProject
//
//  Created by danube83 on 2017. 2. 7..
//  Copyright © 2017년 danube83. All rights reserved.
//

import XCTest

@testable import SampleProject

class DetailTests: XCTestCase {
    let presenter = DetailPresenter()
    let tableView = UITableView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tableView.register(DetailTopTableViewCell.self)
        tableView.register(DetailImageSlideTableViewCell.self)
        tableView.register(DetailDescTableViewCell.self)
        presenter.viewControllerDidLoad(with: "1141258007")
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
    
    func testMakeTopCell() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let cell = self.presenter.cell(at: DetailCell.top.indexPath, of: self.tableView)
            XCTAssertNil(cell)
            
        }
    }
    
    func testMakeImageSlideViewCell() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let cell = self.presenter.cell(at: DetailCell.imageSlide.indexPath, of: self.tableView)
            XCTAssertNil(cell)
        }
    }
    
    func testMakeDescriptionCell() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let cell = self.presenter.cell(at: DetailCell.description.indexPath, of: self.tableView)
            XCTAssertNil(cell)
        }
    }
    
    
    
    
}
