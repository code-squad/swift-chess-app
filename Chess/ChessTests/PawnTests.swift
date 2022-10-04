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

    func test_white_pawn_emoji() {
        sut = Pawn(team: .white)

        XCTAssertEqual(sut.emoji, .whitePawn)
    }

    func test_black_pawn_emoji() {
        sut = Pawn(team: .black)

        XCTAssertEqual(sut.emoji, .blackPawn)
    }

    func test_white_pawn_movablePositions_from_left_edge() {
        sut = Pawn(team: .white)

        let position = Position(file: .A, rank: .eight)
        let expectedResult = [
            Position(file: .B, rank: .eight),
            Position(file: .A, rank: .seven)
        ].sorted {
            if $0.file != $1.file {
                return $0.file.index < $1.file.index
            }
            return $0.rank.index < $1.rank.index
        }

        let result = sut.movablePositions(from: position)
            .sorted {
                if $0.file != $1.file {
                    return $0.file.index < $1.file.index
                }
                return $0.rank.index < $1.rank.index
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_white_pawn_movablePositions_from_right_edge() {
        sut = Pawn(team: .white)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .G, rank: .eight),
            Position(file: .H, rank: .seven)
        ].sorted {
            if $0.file != $1.file {
                return $0.file.index < $1.file.index
            }
            return $0.rank.index < $1.rank.index
        }

        let result = sut.movablePositions(from: position)
            .sorted {
                if $0.file != $1.file {
                    return $0.file.index < $1.file.index
                }
                return $0.rank.index < $1.rank.index
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_white_pawn_movablePositions_from_normal() {
        sut = Pawn(team: .white)

        let position = Position(file: .D, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .C, rank: .eight),
            Position(file: .E, rank: .eight),
            Position(file: .D, rank: .seven)
        ].sorted {
            if $0.file != $1.file {
                return $0.file.index < $1.file.index
            }
            return $0.rank.index < $1.rank.index
        }

        let result = sut.movablePositions(from: position)
            .sorted {
                if $0.file != $1.file {
                    return $0.file.index < $1.file.index
                }
                return $0.rank.index < $1.rank.index
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_black_pawn_movablePositions_from_left_edge() {
        sut = Pawn(team: .black)

        let position = Position(file: .A, rank: .three)
        let expectedResult: [Position] = [
            Position(file: .B, rank: .three),
            Position(file: .A, rank: .four)
        ].sorted {
            if $0.file != $1.file {
                return $0.file.index < $1.file.index
            }
            return $0.rank.index < $1.rank.index
        }

        let result = sut.movablePositions(from: position)
            .sorted {
                if $0.file != $1.file {
                    return $0.file.index < $1.file.index
                }
                return $0.rank.index < $1.rank.index
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_black_pawn_movablePositions_from_right_edge() {
        sut = Pawn(team: .black)

        let position = Position(file: .H, rank: .three)
        let expectedResult: [Position] = [
            Position(file: .G, rank: .three),
            Position(file: .H, rank: .four)
        ].sorted {
            if $0.file != $1.file {
                return $0.file.index < $1.file.index
            }
            return $0.rank.index < $1.rank.index
        }

        let result = sut.movablePositions(from: position)
            .sorted {
                if $0.file != $1.file {
                    return $0.file.index < $1.file.index
                }
                return $0.rank.index < $1.rank.index
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_black_pawn_movablePositions_from_normal() {
        sut = Pawn(team: .black)

        let position = Position(file: .D, rank: .three)
        let expectedResult: [Position] = [
            Position(file: .C, rank: .three),
            Position(file: .E, rank: .three),
            Position(file: .D, rank: .four)
        ].sorted {
            if $0.file != $1.file {
                return $0.file.index < $1.file.index
            }
            return $0.rank.index < $1.rank.index
        }

        let result = sut.movablePositions(from: position)
            .sorted {
                if $0.file != $1.file {
                    return $0.file.index < $1.file.index
                }
                return $0.rank.index < $1.rank.index
            }

        XCTAssertEqual(result, expectedResult)
    }

    func test_white_pawn_canMove_one_left() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .C, rank: .three)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_canMove_one_right() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .E, rank: .three)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_canMove_one_forward() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .D, rank: .two)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_one_backward() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .D, rank: .four)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_two_left() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .B, rank: .three)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_two_right() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .F, rank: .three)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_white_pawn_cannotMove_two_forward() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .four)
        let to = Position(file: .D, rank: .two)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_canMove_one_left() {
        sut = Pawn(team: .black)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .C, rank: .three)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_canMove_one_right() {
        sut = Pawn(team: .black)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .E, rank: .three)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_canMove_one_forward() {
        sut = Pawn(team: .black)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .D, rank: .four)

        XCTAssertTrue(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_one_backward() {
        sut = Pawn(team: .black)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .D, rank: .two)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_two_left() {
        sut = Pawn(team: .black)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .B, rank: .three)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_two_right() {
        sut = Pawn(team: .black)

        let from = Position(file: .D, rank: .three)
        let to = Position(file: .F, rank: .three)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

    func test_black_pawn_cannotMove_two_forward() {
        sut = Pawn(team: .white)

        let from = Position(file: .D, rank: .four)
        let to = Position(file: .D, rank: .six)

        XCTAssertFalse(sut.canMove(from: from, to: to))
    }

}
