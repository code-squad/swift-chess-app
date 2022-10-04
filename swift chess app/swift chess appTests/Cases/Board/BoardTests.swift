//
//  BoardTests.swift
//  swift chess appTests
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import XCTest
@testable import swift_chess_app

final class BoardTests: XCTestCase {

    var sut: Board!

    func testStartGame() {
        sut = Board()
        
        XCTAssertEqual(sut.score.black, 39)
        XCTAssertEqual(sut.score.white, 39)
        XCTAssertEqual(sut.display(), """
 ABCDEFGH
1♜♞♝.♛♝♞♜
2♟♟♟♟♟♟♟♟
3........
4........
5........
6........
7♙♙♙♙♙♙♙♙
8♖♘♗.♕♗♘♖
 ABCDEFGH
"""
        )
    }
    
    func testScore() {
        sut = Board()
        
        XCTAssertTrue(sut.move(from: "B2", to: "B3"))
        XCTAssertTrue(sut.move(from: "G7", to: "G6"))
        
        XCTAssertTrue(sut.move(from: "B3", to: "B4"))
        XCTAssertTrue(sut.move(from: "G6", to: "G5"))
        
        XCTAssertTrue(sut.move(from: "B4", to: "B5"))
        XCTAssertTrue(sut.move(from: "G5", to: "G4"))
        
        XCTAssertTrue(sut.move(from: "B5", to: "B6"))
        XCTAssertTrue(sut.move(from: "G4", to: "G3"))
        
        XCTAssertTrue(sut.move(from: "B6", to: "B7"))
        XCTAssertEqual(sut.score.black, 39)
        XCTAssertEqual(sut.score.white, 38)
        
        XCTAssertTrue(sut.move(from: "G3", to: "G2"))
        XCTAssertEqual(sut.score.black, 38)
        XCTAssertEqual(sut.score.white, 38)
        
        XCTAssertEqual(sut.display(), """
 ABCDEFGH
1♜♞♝.♛♝♞♜
2♟.♟♟♟♟♙♟
3........
4........
5........
6........
7♙♟♙♙♙♙.♙
8♖♘♗.♕♗♘♖
 ABCDEFGH
"""
        )
    }
    
    func testOrder() {
        sut = Board()
        
        XCTAssertTrue(sut.move(from: "B2", to: "B3"))
        XCTAssertEqual(sut.display(), """
 ABCDEFGH
1♜♞♝.♛♝♞♜
2♟.♟♟♟♟♟♟
3.♟......
4........
5........
6........
7♙♙♙♙♙♙♙♙
8♖♘♗.♕♗♘♖
 ABCDEFGH
"""
        )
        
        // 해당 위치가 없는 경우
        XCTAssertFalse(sut.move(from: "A0", to: "B3"))
        XCTAssertFalse(sut.move(from: "B3", to: "B0"))
        
        // 현재 위치에 피스가 없는 경우
        XCTAssertFalse(sut.move(from: "B2", to: "B3"))
        
        // 이동하려는 위치와 현재 위치가 같은 경우
        XCTAssertFalse(sut.move(from: "B2", to: "B2"))
        
        // 차례가 아닌 경우
        XCTAssertFalse(sut.move(from: "B3", to: "B4"))
        
        // 이동하려는 곳에 같은 색 피스가 있는 경우
        XCTAssertFalse(sut.move(from: "H8", to: "H7"))
        
        // 선택된 피스의 이동 규칙이 잘못된 경우
        XCTAssertFalse(sut.move(from: "G7", to: "G9"))
        
        // 경로 중간에 다른 피스가 있는 경우
        XCTAssertFalse(sut.move(from: "H8", to: "H2"))
        XCTAssertTrue(sut.move(from: "G8", to: "F6"))
    }
    
    
    
    func testHelp() {
        sut = Board()

        // 해당 위치가 없는 경우
        XCTAssertNil(sut.help(input: "A0"))
        
        // 현재 위치에 피스가 없는 경우
        XCTAssertNil(sut.help(input: "D6"))
        
        // Pawn 테스트
        XCTAssertEqual(sut.help(input: "C2"), ["C3"])
        XCTAssertEqual(sut.help(input: "H7"), ["H6"])
        
        // Bishop 테스트
        XCTAssertEqual(sut.help(input: "C1"), [])
        
        // Root 테스트
        XCTAssertEqual(sut.help(input: "A8"), [])
        
        // Queen 테스트
        XCTAssertEqual(sut.help(input: "E1"), ["D1"])
        
        // Knight 테스트
        XCTAssertEqual(sut.help(input: "G8"), ["F6", "H6"])
    }
}
