//
//  KnightTests.swift
//  ChessTests
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import XCTest
@testable import Chess

final class KnightTests: XCTestCase {
    var sut: Knight!

    func test_white_knight_emoji() {
        sut = Knight(team: .white)

        XCTAssertEqual(sut.emoji, .whiteKnight)
    }

    func test_black_knight_emoji() {
        sut = Knight(team: .black)

        XCTAssertEqual(sut.emoji, .blackKnight)
    }

    func test_white_knight_movablePositions_from_left_edge() {
        sut = Knight(team: .white)

        let position = Position(file: .A, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .C, rank: .seven),
            Position(file: .B, rank: .six)
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

    func test_white_knight_movablePositions_from_right_edge() {
        sut = Knight(team: .white)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .F, rank: .seven),
            Position(file: .G, rank: .six)
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

    func test_white_knight_movablePositions_from_center() {
        sut = Knight(team: .white)

        let position = Position(file: .D, rank: .four)
        let expectedResult: [Position] = [
            Position(file: .C, rank: .six),
            Position(file: .B, rank: .five),
            Position(file: .E, rank: .six),
            Position(file: .F, rank: .five),
            Position(file: .B, rank: .three),
            Position(file: .C, rank: .two),
            Position(file: .E, rank: .two),
            Position(file: .F, rank: .three)
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

    func test_black_knight_movablePositions_from_left_edge() {
        sut = Knight(team: .black)

        let position = Position(file: .A, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .C, rank: .seven),
            Position(file: .B, rank: .six)
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

    func test_black_knight_movablePositions_from_right_edge() {
        sut = Knight(team: .black)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .F, rank: .seven),
            Position(file: .G, rank: .six)
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

    func test_black_knight_movablePositions_from_center() {
        sut = Knight(team: .black)

        let position = Position(file: .D, rank: .four)
        let expectedResult: [Position] = [
            Position(file: .C, rank: .six),
            Position(file: .B, rank: .five),
            Position(file: .E, rank: .six),
            Position(file: .F, rank: .five),
            Position(file: .B, rank: .three),
            Position(file: .C, rank: .two),
            Position(file: .E, rank: .two),
            Position(file: .F, rank: .three)
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
}
