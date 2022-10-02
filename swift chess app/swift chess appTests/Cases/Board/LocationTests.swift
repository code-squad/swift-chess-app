//
//  LocationTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/02.
//

import XCTest
@testable import swift_chess_app

final class LocationTests: XCTestCase {
    var sut: Location!
    
    func testGetPosition() {
        sut = Location(row: Int.max - Int(UnicodeScalar("1").value), col: 0)
        XCTAssertNil(sut.getPosition())
        
        sut = Location(row: 3, col: 4)
        XCTAssertNotNil(sut.getPosition())
        XCTAssertEqual(sut.getPosition()?.string, "E4")
    }
}
