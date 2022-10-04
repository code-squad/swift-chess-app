//
//  QueenTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/05.
//

import XCTest
@testable import SwiftChess

final class QueenTests: XCTestCase {

    private var sut: Queen?

    override func setUp() {
        super.setUp()
        sut = Queen(color: .black)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_흑색Queen의최초생성위치는_E1이다() {
        let expectedBlackQueenLocation = BoardLocation(file: .E, rank: .one)

        let initialLocations = sut?.initialLocations
        XCTAssertTrue(initialLocations?.contains(expectedBlackQueenLocation) == true)
        XCTAssertEqual(initialLocations?.count, 1)
    }

    func test_백색Queen의최초생성위치는_E8이다() {
        let expectedWhiteQueenLocation = BoardLocation(file: .E, rank: .eight)
        let sut = Queen(color: .white)

        let initialLocations = sut.initialLocations
        XCTAssertTrue(initialLocations.contains(expectedWhiteQueenLocation))
        XCTAssertEqual(initialLocations.count, 1)
    }

    func test_Queen은방해물이없으면최초생성위치에서_21가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .A, rank: .one),
            BoardLocation(file: .B, rank: .one),
            BoardLocation(file: .C, rank: .one),
            BoardLocation(file: .D, rank: .one),
            BoardLocation(file: .F, rank: .one),
            BoardLocation(file: .G, rank: .one),
            BoardLocation(file: .H, rank: .one),
            BoardLocation(file: .A, rank: .five),
            BoardLocation(file: .B, rank: .four),
            BoardLocation(file: .C, rank: .three),
            BoardLocation(file: .D, rank: .two),
            BoardLocation(file: .F, rank: .two),
            BoardLocation(file: .G, rank: .three),
            BoardLocation(file: .H, rank: .four),
            BoardLocation(file: .E, rank: .two),
            BoardLocation(file: .E, rank: .three),
            BoardLocation(file: .E, rank: .four),
            BoardLocation(file: .E, rank: .five),
            BoardLocation(file: .E, rank: .six),
            BoardLocation(file: .E, rank: .seven),
            BoardLocation(file: .E, rank: .eight),
        ]

        let movableLocations = sut?.movableLocations(
            from: BoardLocation(file: .E, rank: .one)
        )
        movableLocations?.forEach { movableLocation in
            XCTAssertTrue(expectedMovableLocations.contains(movableLocation))
        }
        XCTAssertEqual(movableLocations?.count, expectedMovableLocations.count)

    }

    func test_Queen은방해물이없으면D5에서_27가지경로로이동할수있다() {
        let expectedMovableLocations = [
            BoardLocation(file: .A, rank: .two),
            BoardLocation(file: .B, rank: .three),
            BoardLocation(file: .C, rank: .four),
            BoardLocation(file: .E, rank: .six),
            BoardLocation(file: .F, rank: .seven),
            BoardLocation(file: .G, rank: .eight),
            BoardLocation(file: .D, rank: .one),
            BoardLocation(file: .D, rank: .two),
            BoardLocation(file: .D, rank: .three),
            BoardLocation(file: .D, rank: .four),
            BoardLocation(file: .D, rank: .six),
            BoardLocation(file: .D, rank: .seven),
            BoardLocation(file: .D, rank: .eight),
            BoardLocation(file: .A, rank: .eight),
            BoardLocation(file: .B, rank: .seven),
            BoardLocation(file: .C, rank: .six),
            BoardLocation(file: .E, rank: .four),
            BoardLocation(file: .F, rank: .three),
            BoardLocation(file: .G, rank: .two),
            BoardLocation(file: .H, rank: .one),
            BoardLocation(file: .A, rank: .five),
            BoardLocation(file: .B, rank: .five),
            BoardLocation(file: .C, rank: .five),
            BoardLocation(file: .E, rank: .five),
            BoardLocation(file: .F, rank: .five),
            BoardLocation(file: .G, rank: .five),
            BoardLocation(file: .H, rank: .five),
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
