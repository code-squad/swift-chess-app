//
//  KnightTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/05.
//

import XCTest
@testable import SwiftChess

final class KnightTests: XCTestCase {

    private var sut: Knight?

    override func setUp() {
        super.setUp()
        sut = Knight(color: .black)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_흑색Knight의최초생성위치는_B1과G1이다() {
        let expectedFirstBlackKnightLocation = BoardLocation(file: .B, rank: .one)
        let expectedSecondBlackKnightLocation = BoardLocation(file: .G, rank: .one)

        let initialLocations = sut?.initialLocations
        XCTAssertTrue(initialLocations?.contains(expectedFirstBlackKnightLocation) == true)
        XCTAssertTrue(initialLocations?.contains(expectedSecondBlackKnightLocation) == true)
        XCTAssertEqual(initialLocations?.count, 2)
    }

    func test_백색Knight의최초생성위치는_B8과G8이다() {
        let expectedFirstWhiteKnightLocation = BoardLocation(file: .B, rank: .eight)
        let expectedSecondWhiteKnightLocation = BoardLocation(file: .G, rank: .eight)
        let sut = Knight(color: .white)

        let initialLocations = sut.initialLocations
        XCTAssertTrue(initialLocations.contains(expectedFirstWhiteKnightLocation))
        XCTAssertTrue(initialLocations.contains(expectedSecondWhiteKnightLocation))
        XCTAssertEqual(initialLocations.count, 2)
    }

    func test_Knight은방해물이없으면최초생성위치에서_3가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .A, rank: .three),
            BoardLocation(file: .C, rank: .three),
            BoardLocation(file: .D, rank: .two),
        ]

        let movableLocations = sut?.movableLocations(
            from: BoardLocation(file: .B, rank: .one)
        )
        movableLocations?.forEach { movableLocation in
            XCTAssertTrue(expectedMovableLocations.contains(movableLocation))
        }
        XCTAssertEqual(movableLocations?.count, expectedMovableLocations.count)

    }

    func test_Bishop은방해물이없으면D5에서_8가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .C, rank: .three),
            BoardLocation(file: .E, rank: .three),
            BoardLocation(file: .B, rank: .four),
            BoardLocation(file: .F, rank: .four),
            BoardLocation(file: .B, rank: .six),
            BoardLocation(file: .F, rank: .six),
            BoardLocation(file: .C, rank: .seven),
            BoardLocation(file: .E, rank: .seven),
        ]

        let movableLocations = sut?.movableLocations(
            from: BoardLocation(file: .D, rank: .five)
        )
        movableLocations?.forEach { movableLocation in
            XCTAssertTrue(expectedMovableLocations.contains(movableLocation))
        }
        XCTAssertEqual(movableLocations?.count, expectedMovableLocations.count)
    }
}
