//
//  BoardTests.swift
//  SwiftChessAppTests
//
//  Created by taehyeon.lee on 2022/10/05.
//

import XCTest

final class BoardTests: XCTestCase {

    func test_보드_초기배치() throws {
        let board = Board()
        board.newGame()
        XCTAssertEqual(board.display(), [
            "♜♞♝♚♛♝♞♜",
            "♟♟♟♟♟♟♟♟",
            "........",
            "........",
            "........",
            "........",
            "♙♙♙♙♙♙♙♙",
            "♖♘♗♔♕♗♘♖"
        ])
    }

    func test_보드_초기배치_점수() throws {
        let board = Board()
        board.newGame()
        let score = board.score()
        let answer = Board.Score(black: 39, white: 39)
        XCTAssertEqual(score.white, answer.white)
        XCTAssertEqual(score.black, answer.black)
    }

    func test_보드_white폰1칸이동() throws {
        let board = Board()
        board.newGame()
        let hadMoved = board.move(from: .init(x: .G, y: .seven), to: .init(x: .G, y: .six))
        if hadMoved {
            XCTAssertEqual(board.display(), [
                "♜♞♝♚♛♝♞♜",
                "♟♟♟♟♟♟♟♟",
                "........",
                "........",
                "........",
                "......♙.",
                "♙♙♙♙♙♙.♙",
                "♖♘♗♔♕♗♘♖"
            ])
        } else {
            XCTAssertEqual(board.display(), [
                "♜♞♝♚♛♝♞♜",
                "♟♟♟♟♟♟♟♟",
                "........",
                "........",
                "........",
                "........",
                "♙♙♙♙♙♙♙♙",
                "♖♘♗♔♕♗♘♖"
            ])
        }
    }

    func test_보드_white폰이_black폰_먹음() throws {
        let board = Board()
        board.newGame()
        board.move(from: .init(x: .G, y: .seven), to: .init(x: .G, y: .six))
        board.move(from: .init(x: .G, y: .two), to: .init(x: .G, y: .three))
        board.move(from: .init(x: .G, y: .six), to: .init(x: .G, y: .five))
        board.move(from: .init(x: .G, y: .three), to: .init(x: .G, y: .four))
        board.move(from: .init(x: .G, y: .five), to: .init(x: .G, y: .four))
        XCTAssertEqual(board.display(), [
            "♜♞♝♚♛♝♞♜",
            "♟♟♟♟♟♟.♟",
            "........",
            "......♙.",
            "........",
            "........",
            "♙♙♙♙♙♙.♙",
            "♖♘♗♔♕♗♘♖"
        ])

        let score = board.score()
        let answer = Board.Score(black: 38, white: 39)
        XCTAssertEqual(score.white, answer.white)
        XCTAssertEqual(score.black, answer.black)
    }
}
