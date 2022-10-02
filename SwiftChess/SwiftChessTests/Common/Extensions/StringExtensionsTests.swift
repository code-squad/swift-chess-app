//
//  StringExtensionsTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/02.
//

import XCTest
@testable import SwiftChess

final class StringExtensionsTests: XCTestCase {

    func test_A의ASCIIValue는_65이다() {
        let sut: String = "A"
        let expectedAsciiValue = 65

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_B의ASCIIValue는_66이다() {
        let sut: String = "B"
        let expectedAsciiValue = 66

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_C의ASCIIValue는_67이다() {
        let sut: String = "C"
        let expectedAsciiValue = 67

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_D의ASCIIValue는_68이다() {
        let sut: String = "D"
        let expectedAsciiValue = 68

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_E의ASCIIValue는_69이다() {
        let sut: String = "E"
        let expectedAsciiValue = 69

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_F의ASCIIValue는_70이다() {
        let sut: String = "F"
        let expectedAsciiValue = 70

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_G의ASCIIValue는_71이다() {
        let sut: String = "G"
        let expectedAsciiValue = 71

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }

    func test_H의ASCIIValue는_72이다() {
        let sut: String = "H"
        let expectedAsciiValue = 72

        XCTAssertEqual(sut.asciiValue, expectedAsciiValue)
    }
}
