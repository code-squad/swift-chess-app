//
//  PawnTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/09/28.
//

import XCTest
@testable import SwiftChess

final class PawnTests: XCTestCase {

    func test_흑색Pawn의최초Rank는_2이다() {
        let blackPawn = Pawn(color: .black)

        blackPawn.initialLocations.forEach { initialLocation in
            XCTAssertEqual(initialLocation.rank, .two)
        }
    }

    func test_백색Pawn의최초Rank는_7이다() {
        let whitePawn = Pawn(color: .white)

        whitePawn.initialLocations.forEach { initialLocation in
            XCTAssertEqual(initialLocation.rank, .seven)
        }
    }
}
