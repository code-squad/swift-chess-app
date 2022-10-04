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

}


