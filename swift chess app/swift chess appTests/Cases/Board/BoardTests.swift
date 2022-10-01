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

    func testStartGame() throws {
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
        
        // 선택된 곳에 말이 없는 경우
        XCTAssertFalse(sut.move(from: "B2", to: "B3"))
        // 같은 색의 말을 잡는 경우
        XCTAssertFalse(sut.move(from: "H8", to: "H7"))
        
        // 순서가 안맞는 경우
        XCTAssertFalse(sut.move(from: "B3", to: "B4"))
        // 이동이 틀린 경우
        XCTAssertFalse(sut.move(from: "G7", to: "G9"))
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

}
