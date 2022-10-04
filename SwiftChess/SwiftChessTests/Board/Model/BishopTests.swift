//
//  BishopTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/05.
//

import XCTest
@testable import SwiftChess

final class BishopTests: XCTestCase {

    private var sut: Bishop?

    override func setUp() {
        super.setUp()
        sut = Bishop(color: .black)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_흑색Bishop의최초생성위치는_C1과F1이다() {
        let expectedFirstBlackBishopLocation = BoardLocation(file: .C, rank: .one)
        let expectedSecondBlackBishopLocation = BoardLocation(file: .F, rank: .one)

        let initialLocations = sut?.initialLocations
        XCTAssertTrue(initialLocations?.contains(expectedFirstBlackBishopLocation) == true)
        XCTAssertTrue(initialLocations?.contains(expectedSecondBlackBishopLocation) == true)
        XCTAssertEqual(initialLocations?.count, 2)
    }

    func test_백색Bishop의최초생성위치는_C8과F8이다() {
        let expectedFirstWhiteBishopLocation = BoardLocation(file: .C, rank: .eight)
        let expectedSecondWhiteBishopLocation = BoardLocation(file: .F, rank: .eight)
        let sut = Bishop(color: .white)

        let initialLocations = sut.initialLocations
        XCTAssertTrue(initialLocations.contains(expectedFirstWhiteBishopLocation))
        XCTAssertTrue(initialLocations.contains(expectedSecondWhiteBishopLocation))
        XCTAssertEqual(initialLocations.count, 2)
    }

    func test_Bishop은방해물이없으면최초생성위치에서_대각선방향으로7가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .A, rank: .three),
            BoardLocation(file: .B, rank: .two),
            BoardLocation(file: .D, rank: .two),
            BoardLocation(file: .E, rank: .three),
            BoardLocation(file: .F, rank: .four),
            BoardLocation(file: .G, rank: .five),
            BoardLocation(file: .H, rank: .six),
        ]

        let movableLocations = sut?.movableLocations(
            from: BoardLocation(file: .C, rank: .one)
        )
        movableLocations?.forEach { movableLocation in
            XCTAssertTrue(expectedMovableLocations.contains(movableLocation))
        }
        XCTAssertEqual(movableLocations?.count, expectedMovableLocations.count)
    }

    func test_Bishop은방해물이없으면D4에서_대각선방향으로13가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .A, rank: .one),
            BoardLocation(file: .B, rank: .two),
            BoardLocation(file: .C, rank: .three),
            BoardLocation(file: .E, rank: .five),
            BoardLocation(file: .F, rank: .six),
            BoardLocation(file: .G, rank: .seven),
            BoardLocation(file: .H, rank: .eight),
            BoardLocation(file: .A, rank: .seven),
            BoardLocation(file: .B, rank: .six),
            BoardLocation(file: .C, rank: .five),
            BoardLocation(file: .E, rank: .three),
            BoardLocation(file: .F, rank: .two),
            BoardLocation(file: .G, rank: .one),
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
