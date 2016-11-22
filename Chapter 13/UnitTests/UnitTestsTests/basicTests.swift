//
//  basicTests.swift
//  UnitTests
//
//  Created by Jak Tiano on 10/23/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

import XCTest
@testable import UnitTests

class BasicTests : XCTestCase {
    
    var model: TestModel!
    
    override func setUp() {
        model = TestModel()
    }
    
    func testExample1() {
        XCTAssertEqual(model.example1(), 1)
    }
    
    func testExample2() {
        XCTAssertEqual(model.example2(), 2)
    }
    
    func testExample3() {
        XCTAssertEqual(model.example3(), 3)
    }
    
}
