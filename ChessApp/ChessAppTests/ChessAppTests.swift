//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by 최동규 on 2022/09/26.
//

import XCTest
@testable import ChessApp

class ChessAppTests: XCTestCase {

    func testBoardInit() {
        let users: [User] = [BlackUser(), WhiteUser()]
        let chessGame = ChessGame(users: users)

        let expectedString = """
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

        let descriptionString = chessGame.board.description()
        XCTAssertEqual(descriptionString, expectedString)
    }


    func test_WhitePawnNextPossiblePositions() {
        let pawn = Pawn(position: Position(rank: Rank(3), file: File(3))!, user: WhiteUser())

        XCTAssertEqual(pawn.nextPossiblePositions , [Position(rank: Rank(2), file: File(3))!])
    }

    func test_BlackPawnNextPossiblePositions() {
        let pawn = Pawn(position: Position(rank: Rank(3), file: File(3))!, user: BlackUser())

        XCTAssertEqual(pawn.nextPossiblePositions , [Position(rank: Rank(4), file: File(3))!])
    }

    func test_WhitePawnIconString() {
        let pawn = Pawn(position: Position(rank: Rank(3), file: File(3))!, user: WhiteUser())

        XCTAssertEqual(pawn.iconString , "♙")
    }

    func test_BlackPawnNextIconString() {
        let pawn = Pawn(position: Position(rank: Rank(3), file: File(3))!, user: BlackUser())

        XCTAssertEqual(pawn.iconString , "♟")
    }
//
//    func testMove_white() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 6), to: .init(row: 1, section: 5))
//        let pawn = board.matrix[5][1]
//        XCTAssertNotNil(pawn)
//        XCTAssertEqual(pawn?.type, .white)
//
//    }
//
//    func testMove_black_exception_back() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 1), to: .init(row: 1, section: 0))
//        let pawn = board.matrix[0][1]
//        XCTAssertNil(pawn)
//    }
//
//    func testMove_white_exception_back() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 6), to: .init(row: 2, section: 6))
//        let pawn = board.matrix[7][1]
//        XCTAssertNil(pawn)
//
//    }
//
//
//    func testMove_black_exception_left() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 1), to: .init(row: 1, section: 2))
//        board.move(current: .init(row: 1, section: 2), to: .init(row: 0, section: 2))
//        let pawn = board.matrix[2][0]
//        XCTAssertNil(pawn)
//    }
//
//    func testMove_white_exception_right() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 6), to: .init(row: 1, section: 5))
//        board.move(current: .init(row: 1, section: 5), to: .init(row: 2, section: 5))
//        let pawn = board.matrix[5][2]
//        XCTAssertNil(pawn)
//    }
//
//    func testGetPoint_black() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 1), to: .init(row: 1, section: 2))
//        board.move(current: .init(row: 1, section: 2), to: .init(row: 1, section: 3))
//        board.move(current: .init(row: 1, section: 3), to: .init(row: 1, section: 4))
//        board.move(current: .init(row: 1, section: 4), to: .init(row: 1, section: 5))
//        board.move(current: .init(row: 1, section: 5), to: .init(row: 1, section: 6))
//        XCTAssertEqual(board.scoreForBlack, 1)
//    }
//
//    func testGetPoint_white() {
//        let board = Board()
//        board.move(current: .init(row: 1, section: 6), to: .init(row: 1, section: 5))
//        board.move(current: .init(row: 1, section: 5), to: .init(row: 1, section: 4))
//        board.move(current: .init(row: 1, section: 4), to: .init(row: 1, section: 3))
//        board.move(current: .init(row: 1, section: 3), to: .init(row: 1, section: 2))
//        board.move(current: .init(row: 1, section: 2), to: .init(row: 1, section: 1))
//        XCTAssertEqual(board.scoreForWhite, 1)
//    }

}


