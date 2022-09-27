//
//  ChessRankTests.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/27.
//

import XCTest
@testable import swift_chess_app


class ChessRankTests: XCTestCase {
    
    var sut: ChessRank?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = nil
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_rank_is_valid_when_num_is_3() {
        // given
        let num = 3
        
        // when
        sut = ChessRank(num)
        
        // then
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut!.num, 3)
    }
    
    func test_rank_is_valid_when_num_is_0() {
        // given
        let num = 0
        
        // when
        sut = ChessRank(num)
        
        // then
        XCTAssertNil(sut)
    }
    
    func test_rank_is_valid_when_num_is_minus1() {
        // given
        let num = -1
        
        // when
        sut = ChessRank(num)
        
        // then
        XCTAssertNil(sut)
    }
    
    func test_rank_is_valid_when_num_is_8() {
        // given
        let num = 8
        
        // when
        sut = ChessRank(num)
        
        // then
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut!.num, 8)
    }
    
    func test_rank_is_valid_when_num_is_9() {
        // given
        let num = 9
        
        // when
        sut = ChessRank(num)
        
        // then
        XCTAssertNil(sut)
    }
    
    func test_rank_is_valid_when_string_is_3() {
        // given
        let string = "3"
        
        // when
        sut = ChessRank(string)
        
        // then
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut!.num, 3)
    }
    
    func test_rank_is_valid_when_string_is_0() {
        // given
        let string = "0"
        
        // when
        sut = ChessRank(string)
        
        // then
        XCTAssertNil(sut)
    }
    
    func test_rank_is_valid_when_string_is_minus1() {
        // given
        let string = "-1"
        
        // when
        sut = ChessRank(string)
        
        // then
        XCTAssertNil(sut)
    }
    
    func test_rank_is_valid_when_string_is_8() {
        // given
        let string = "8"
        
        // when
        sut = ChessRank(string)
        
        // then
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut!.num, 8)
    }
    
    func test_rank_is_valid_when_string_is_9() {
        // given
        let string = "9"
        
        // when
        sut = ChessRank(string)
        
        // then
        XCTAssertNil(sut)
    }
}
