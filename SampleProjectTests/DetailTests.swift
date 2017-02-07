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
    let dataProvider = DetailDataProvider()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadData() {
        let asyncExpectation = expectation(description: "load Data")
        dataProvider.loadDetailData(with: "1141258007") {
            
            XCTAssertNotNil(self.dataProvider.applicationDetail)
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                print("timeout error \(error)")
            }
            
        }
    }
    
}
