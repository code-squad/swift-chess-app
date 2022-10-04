//
//  QueenTests.swift
//  ChessTests
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import XCTest
@testable import Chess

final class QueenTests: XCTestCase {
    var sut: Queen!

    func test_white_queen_emoji() {
        sut = Queen(team: .white)

        XCTAssertEqual(sut.emoji, .whiteQueen)
    }

    func test_black_queen_emoji() {
        sut = Queen(team: .black)

        XCTAssertEqual(sut.emoji, .blackQueen)
    }

    func test_white_queen_movablePositions_from_left_edge() {
        sut = Queen(team: .white)

        let position = Position(file: .A, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .B, rank: .eight),
            Position(file: .C, rank: .eight),
            Position(file: .D, rank: .eight),
            Position(file: .E, rank: .eight),
            Position(file: .F, rank: .eight),
            Position(file: .G, rank: .eight),
            Position(file: .H, rank: .eight),
            Position(file: .A, rank: .seven),
            Position(file: .A, rank: .six),
            Position(file: .A, rank: .five),
            Position(file: .A, rank: .four),
            Position(file: .A, rank: .three),
            Position(file: .A, rank: .two),
            Position(file: .A, rank: .one),
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

    func test_white_queen_movablePositions_from_right_edge() {
        sut = Queen(team: .white)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .A, rank: .eight),
            Position(file: .B, rank: .eight),
            Position(file: .C, rank: .eight),
            Position(file: .D, rank: .eight),
            Position(file: .E, rank: .eight),
            Position(file: .F, rank: .eight),
            Position(file: .G, rank: .eight),
            Position(file: .H, rank: .seven),
            Position(file: .H, rank: .six),
            Position(file: .H, rank: .five),
            Position(file: .H, rank: .four),
            Position(file: .H, rank: .three),
            Position(file: .H, rank: .two),
            Position(file: .H, rank: .one),
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

    func test_white_queen_movablePositions_from_center() {
        sut = Queen(team: .white)

        let position = Position(file: .D, rank: .five)
        let expectedResult: [Position] = [
            Position(file: .D, rank: .eight),
            Position(file: .D, rank: .seven),
            Position(file: .D, rank: .six),
            Position(file: .D, rank: .four),
            Position(file: .D, rank: .three),
            Position(file: .D, rank: .two),
            Position(file: .D, rank: .one),
            Position(file: .A, rank: .five),
            Position(file: .B, rank: .five),
            Position(file: .C, rank: .five),
            Position(file: .E, rank: .five),
            Position(file: .F, rank: .five),
            Position(file: .G, rank: .five),
            Position(file: .H, rank: .five),
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

    func test_black_queen_movablePositions_from_left_edge() {
        sut = Queen(team: .black)

        let position = Position(file: .A, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .B, rank: .eight),
            Position(file: .C, rank: .eight),
            Position(file: .D, rank: .eight),
            Position(file: .E, rank: .eight),
            Position(file: .F, rank: .eight),
            Position(file: .G, rank: .eight),
            Position(file: .H, rank: .eight),
            Position(file: .A, rank: .seven),
            Position(file: .A, rank: .six),
            Position(file: .A, rank: .five),
            Position(file: .A, rank: .four),
            Position(file: .A, rank: .three),
            Position(file: .A, rank: .two),
            Position(file: .A, rank: .one),
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

    func test_black_queen_movablePositions_from_right_edge() {
        sut = Queen(team: .black)

        let position = Position(file: .H, rank: .eight)
        let expectedResult: [Position] = [
            Position(file: .A, rank: .eight),
            Position(file: .B, rank: .eight),
            Position(file: .C, rank: .eight),
            Position(file: .D, rank: .eight),
            Position(file: .E, rank: .eight),
            Position(file: .F, rank: .eight),
            Position(file: .G, rank: .eight),
            Position(file: .H, rank: .seven),
            Position(file: .H, rank: .six),
            Position(file: .H, rank: .five),
            Position(file: .H, rank: .four),
            Position(file: .H, rank: .three),
            Position(file: .H, rank: .two),
            Position(file: .H, rank: .one),
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

    func test_black_queen_movablePositions_from_center() {
        sut = Queen(team: .black)

        let position = Position(file: .D, rank: .five)
        let expectedResult: [Position] = [
            Position(file: .D, rank: .eight),
            Position(file: .D, rank: .seven),
            Position(file: .D, rank: .six),
            Position(file: .D, rank: .four),
            Position(file: .D, rank: .three),
            Position(file: .D, rank: .two),
            Position(file: .D, rank: .one),
            Position(file: .A, rank: .five),
            Position(file: .B, rank: .five),
            Position(file: .C, rank: .five),
            Position(file: .E, rank: .five),
            Position(file: .F, rank: .five),
            Position(file: .G, rank: .five),
            Position(file: .H, rank: .five),
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
