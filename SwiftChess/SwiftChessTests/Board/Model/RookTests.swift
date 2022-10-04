//
//  RookTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/05.
//

import XCTest
@testable import SwiftChess

final class RookTests: XCTestCase {

    private var sut: Rook?

    override func setUp() {
        super.setUp()
        sut = Rook(color: .black)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_흑색Rook의최초생성위치는_A1과H1이다() {
        let expectedFirstBlackRookLocation = BoardLocation(file: .A, rank: .one)
        let expectedSecondBlackRookLocation = BoardLocation(file: .H, rank: .one)

        let initialLocations = sut?.initialLocations
        XCTAssertTrue(initialLocations?.contains(expectedFirstBlackRookLocation) == true)
        XCTAssertTrue(initialLocations?.contains(expectedSecondBlackRookLocation) == true)
        XCTAssertEqual(initialLocations?.count, 2)
    }

    func test_백색Rook의최초생성위치는_A8과H8이다() {
        let expectedFirstWhiteRookLocation = BoardLocation(file: .A, rank: .eight)
        let expectedSecondWhiteRookLocation = BoardLocation(file: .H, rank: .eight)
        let sut = Rook(color: .white)

        let initialLocations = sut.initialLocations
        XCTAssertTrue(initialLocations.contains(expectedFirstWhiteRookLocation))
        XCTAssertTrue(initialLocations.contains(expectedSecondWhiteRookLocation))
        XCTAssertEqual(initialLocations.count, 2)
    }

    func test_Rook은방해물이없으면최초생성위치에서_직선방향으로14가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .B, rank: .one),
            BoardLocation(file: .C, rank: .one),
            BoardLocation(file: .D, rank: .one),
            BoardLocation(file: .E, rank: .one),
            BoardLocation(file: .F, rank: .one),
            BoardLocation(file: .G, rank: .one),
            BoardLocation(file: .H, rank: .one),
            BoardLocation(file: .A, rank: .two),
            BoardLocation(file: .A, rank: .three),
            BoardLocation(file: .A, rank: .four),
            BoardLocation(file: .A, rank: .five),
            BoardLocation(file: .A, rank: .six),
            BoardLocation(file: .A, rank: .seven),
            BoardLocation(file: .A, rank: .eight),
        ]

        let movableLocations = sut?.movableLocations(
            from: BoardLocation(file: .A, rank: .one)
        )
        movableLocations?.forEach { movableLocation in
            XCTAssertTrue(expectedMovableLocations.contains(movableLocation))
        }
        XCTAssertEqual(movableLocations?.count, expectedMovableLocations.count)
    }

    func test_Bishop은방해물이없으면D4에서_직선방향으로14가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .A, rank: .four),
            BoardLocation(file: .B, rank: .four),
            BoardLocation(file: .C, rank: .four),
            BoardLocation(file: .E, rank: .four),
            BoardLocation(file: .F, rank: .four),
            BoardLocation(file: .G, rank: .four),
            BoardLocation(file: .H, rank: .four),
            BoardLocation(file: .D, rank: .one),
            BoardLocation(file: .D, rank: .two),
            BoardLocation(file: .D, rank: .three),
            BoardLocation(file: .D, rank: .five),
            BoardLocation(file: .D, rank: .six),
            BoardLocation(file: .D, rank: .seven),
            BoardLocation(file: .D, rank: .eight),
        ]

        let movableLocations = sut?.movableLocations(
            from: BoardLocation(file: .D, rank: .four)
        )
        movableLocations?.forEach { movableLocation in
            XCTAssertTrue(expectedMovableLocations.contains(movableLocation))
        }
        XCTAssertEqual(movableLocations?.count, expectedMovableLocations.count)
    }
}
