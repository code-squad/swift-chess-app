//
//  PositionTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/02.
//

import XCTest
@testable import swift_chess_app

final class PositionTests: XCTestCase {
    var sut: Position!
    
    func testMakePosition() {
        sut = Position(input: "B31")
        XCTAssertNil(sut)
        
        sut = Position(input: "G8")
        XCTAssertNotNil(sut)
    }
    
    func testGetLocation() {
        sut = Position(input: "H2")
        XCTAssertEqual(sut.getLocation()?.row, 1)
        XCTAssertEqual(sut.getLocation()?.col, 7)
    }
}
