//
//  ChessBoardTests.swift
//  ChessTests
//
//  Created by jaeyoung Yun on 2022/09/25.
//

import XCTest
@testable import Chess

final class ChessBoardTests: XCTestCase {
    var sut: ChessBoard!

    override func setUp() {
        super.setUp()

        sut = ChessBoard()
    }

    func test_chessBoard_initial_display() {
        let expectedResult =
        """
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

        let result = sut.display()

        XCTAssertEqual(result, expectedResult)
    }

    func test_chessBoard_A7_to_A6_display() {
        let expectedResult =
        """
         ABCDEFGH
        1♜♞♝.♛♝♞♜
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6♙.......
        7.♙♙♙♙♙♙♙
        8♖♘♗.♕♗♘♖
         ABCDEFGH
        """

        _ = sut.move(from: "A7", to: "A6")
        let result = sut.display()

        XCTAssertEqual(result, expectedResult)
    }

    func test_chessBoard_move_one_forward() {
        let result = sut.move(from: "A7", to: "A6")

        XCTAssertTrue(result)
    }

    func test_chessBoard_move_nothing() {
        let result = sut.move(from: "A8", to: "A7")

        XCTAssertFalse(result)
    }

    func test_chessBoard_move_wrong_input() {
        let result = sut.move(from: "pawn", to: "A6")

        XCTAssertFalse(result)
    }
}
