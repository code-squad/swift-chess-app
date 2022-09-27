//
//  ChessFileTests.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/27.
//

import XCTest
@testable import swift_chess_app


class ChessFileTests: XCTestCase {
    
    var sut: ChessFile?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = nil
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_file_is_valid_when_string_is_A() {
        // given
        let string = "A"
        
        // when
        sut = ChessFile(string)
        
        // then
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut!.toString, "A")
    }
    
    func test_file_is_valid_when_string_is_B() {
        // given
        let string = "B"
        
        // when
        sut = ChessFile(string)
        
        // then
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut!.toString, "B")
    }
    
    func test_file_is_valid_when_string_is_X() {
        // given
        let string = "X"
        
        // when
        sut = ChessFile(string)
        
        // then
        XCTAssertNil(sut)
    }
}
