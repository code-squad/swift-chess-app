//
//  PawnTests.swift
//  ChessTests
//
//  Created by jaeyoung Yun on 2022/09/25.
//

import XCTest
@testable import Chess

final class PawnTests: XCTestCase {
    var sut: Pawn!

    override func setUp() {
        super.setUp()

        sut = Pawn(team: .black)
    }

    func test_white_pawn_emoji() {
        sut = Pawn(team: .white)

        XCTAssertEqual(sut.emoji, "♙")
    }

    func test_black_pawn_emoji() {
        sut = Pawn(team: .black)

        XCTAssertEqual(sut.emoji, "♟")
    }

    func test_white_pawn_movablePositions_from_left_edge() {
        sut = Pawn(team: .white)

        let position = Position(fileIndex: 0, rankIndex: 7)
        let expectedResult: [Position] = [
            Position(fileIndex: 1, rankIndex: 7),
            Position(fileIndex: 0, rankIndex: 6)
        ]
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        let result = sut.movablePositions(from: position)
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_white_pawn_movablePositions_from_right_edge() {
        sut = Pawn(team: .white)

        let position = Position(fileIndex: 7, rankIndex: 7)
        let expectedResult: [Position] = [
            Position(fileIndex: 6, rankIndex: 7),
            Position(fileIndex: 7, rankIndex: 6)
        ]
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        let result = sut.movablePositions(from: position)
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_white_pawn_movablePositions_from_normal() {
        sut = Pawn(team: .white)

        let position = Position(fileIndex: 3, rankIndex: 7)
        let expectedResult: [Position] = [
            Position(fileIndex: 2, rankIndex: 7),
            Position(fileIndex: 4, rankIndex: 7),
            Position(fileIndex: 3, rankIndex: 6)
        ]
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        let result = sut.movablePositions(from: position)
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_black_pawn_movablePositions_from_left_edge() {
        sut = Pawn(team: .black)

        let position = Position(fileIndex: 0, rankIndex: 2)
        let expectedResult: [Position] = [
            Position(fileIndex: 1, rankIndex: 2),
            Position(fileIndex: 0, rankIndex: 3)
        ]
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        let result = sut.movablePositions(from: position)
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_black_pawn_movablePositions_from_right_edge() {
        sut = Pawn(team: .black)

        let position = Position(fileIndex: 7, rankIndex: 2)
        let expectedResult: [Position] = [
            Position(fileIndex: 6, rankIndex: 2),
            Position(fileIndex: 7, rankIndex: 3)
        ]
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        let result = sut.movablePositions(from: position)
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_black_pawn_movablePositions_from_normal() {
        sut = Pawn(team: .black)

        let position = Position(fileIndex: 3, rankIndex: 2)
        let expectedResult: [Position] = [
            Position(fileIndex: 2, rankIndex: 2),
            Position(fileIndex: 4, rankIndex: 2),
            Position(fileIndex: 3, rankIndex: 3)
        ]
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        let result = sut.movablePositions(from: position)
            .sorted {
                $0.fileIndex < $1.fileIndex && $0.rankIndex < $1.rankIndex
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_white_pawn_canMove_one_left() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 2, rankIndex: 2)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_canMove_one_right() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 4, rankIndex: 2)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_canMove_one_forward() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 3, rankIndex: 1)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_one_backward() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 3, rankIndex: 3)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_two_left() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 1, rankIndex: 2)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_two_right() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 5, rankIndex: 2)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_two_forward() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 3)
        let to = Position(fileIndex: 3, rankIndex: 1)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_canMove_one_left() {
        sut = Pawn(team: .black)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 2, rankIndex: 2)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_canMove_one_right() {
        sut = Pawn(team: .black)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 4, rankIndex: 2)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_canMove_one_forward() {
        sut = Pawn(team: .black)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 3, rankIndex: 3)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_one_backward() {
        sut = Pawn(team: .black)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 3, rankIndex: 1)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_two_left() {
        sut = Pawn(team: .black)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 1, rankIndex: 2)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_two_right() {
        sut = Pawn(team: .black)

        let from = Position(fileIndex: 3, rankIndex: 2)
        let to = Position(fileIndex: 5, rankIndex: 2)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_two_forward() {
        sut = Pawn(team: .white)

        let from = Position(fileIndex: 3, rankIndex: 3)
        let to = Position(fileIndex: 3, rankIndex: 5)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

}
