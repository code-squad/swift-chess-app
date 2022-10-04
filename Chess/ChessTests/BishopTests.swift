//
//  BishopTests.swift
//  ChessTests
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import XCTest
@testable import Chess

final class BishopTests: XCTestCase {
    var sut: Bishop!

    func test_white_bishop_emoji() {
        sut = Bishop(team: .white)

        XCTAssertEqual(sut.emoji, .whiteBishop)
    }

    func test_black_bishop_emoji() {
        sut = Bishop(team: .black)

        XCTAssertEqual(sut.emoji, .blackBishop)
    }

    func test_white_bishop_movablePositions_from_left_edge() {
        sut = Bishop(team: .white)

        let position = Position(file: .A, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .B, rank: .seven),
            Position(file: .C, rank: .six),
            Position(file: .D, rank: .five),
            Position(file: .E, rank: .four),
            Position(file: .F, rank: .three),
            Position(file: .G, rank: .two),
            Position(file: .H, rank: .one)
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

    func test_white_bishop_movablePositions_from_right_edge() {
        sut = Bishop(team: .white)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .G, rank: .seven),
            Position(file: .F, rank: .six),
            Position(file: .E, rank: .five),
            Position(file: .D, rank: .four),
            Position(file: .C, rank: .three),
            Position(file: .B, rank: .two),
            Position(file: .A, rank: .one)
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

    func test_white_bishop_movablePositions_from_center() {
        sut = Bishop(team: .white)

        let position = Position(file: .D, rank: .five)
        let expectedResult: [Position] = [
            Position(file: .A, rank: .eight),
            Position(file: .B, rank: .seven),
            Position(file: .C, rank: .six),
            Position(file: .E, rank: .six),
            Position(file: .F, rank: .seven),
            Position(file: .G, rank: .eight),
            Position(file: .C, rank: .four),
            Position(file: .B, rank: .three),
            Position(file: .A, rank: .two),
            Position(file: .E, rank: .four),
            Position(file: .F, rank: .three),
            Position(file: .G, rank: .two),
            Position(file: .H, rank: .one)
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

    func test_black_bishop_movablePositions_from_left_edge() {
        sut = Bishop(team: .black)

        let position = Position(file: .A, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .B, rank: .seven),
            Position(file: .C, rank: .six),
            Position(file: .D, rank: .five),
            Position(file: .E, rank: .four),
            Position(file: .F, rank: .three),
            Position(file: .G, rank: .two),
            Position(file: .H, rank: .one)
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

    func test_black_bishop_movablePositions_from_right_edge() {
        sut = Bishop(team: .black)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .G, rank: .seven),
            Position(file: .F, rank: .six),
            Position(file: .E, rank: .five),
            Position(file: .D, rank: .four),
            Position(file: .C, rank: .three),
            Position(file: .B, rank: .two),
            Position(file: .A, rank: .one)
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

    func test_black_bishop_movablePositions_from_center() {
        sut = Bishop(team: .black)

        let position = Position(file: .D, rank: .five)
        let expectedResult: [Position] = [
            Position(file: .A, rank: .eight),
            Position(file: .B, rank: .seven),
            Position(file: .C, rank: .six),
            Position(file: .E, rank: .six),
            Position(file: .F, rank: .seven),
            Position(file: .G, rank: .eight),
            Position(file: .C, rank: .four),
            Position(file: .B, rank: .three),
            Position(file: .A, rank: .two),
            Position(file: .E, rank: .four),
            Position(file: .F, rank: .three),
            Position(file: .G, rank: .two),
            Position(file: .H, rank: .one)
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
