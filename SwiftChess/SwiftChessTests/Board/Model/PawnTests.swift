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

        XCTAssertEqual(blackPawn.initialRank, 2)
    }

    func test_백색Pawn의최초Rank는_7이다() {
        let whitePawn = Pawn(color: .white)

        XCTAssertEqual(whitePawn.initialRank, 7)
    }
}
