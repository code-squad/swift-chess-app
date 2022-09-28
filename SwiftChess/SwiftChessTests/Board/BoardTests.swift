//
//  BoardTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/09/28.
//

import XCTest
@testable import SwiftChess

final class BoardTests: XCTestCase {

    private var sut: Board?

    override func setUp() {
        super.setUp()
        sut = Board()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_흑색Pawn의최초생성위치는_2rank이다() throws {
        let expectedPieceColor = PieceColor.black
        let secondRank = try sut?.rank(2)

        secondRank?.forEach { piece in
            XCTAssertTrue(piece is Pawn)
            XCTAssertEqual(piece?.color, expectedPieceColor)
        }
    }

    func test_백색Pawn의최초생성위치는_7rank이다() throws {
        let expectedPieceColor = PieceColor.white
        let secondRank = try sut?.rank(7)

        secondRank?.forEach { piece in
            XCTAssertTrue(piece is Pawn)
            XCTAssertEqual(piece?.color, expectedPieceColor)
        }
    }

    func test_색상별최초Pawn의생성개수는_8개이다() {
        let expectedPawnCount = 8
        let existingPawns = sut?.pieceCount(for: Pawn.self)

        XCTAssertEqual(existingPawns?.black, expectedPawnCount)
        XCTAssertEqual(existingPawns?.white, expectedPawnCount)
    }
}

extension Board {

    func rank(_ rank: Int) throws -> [Piece?] {
        guard (1...Self.Configuration.size.rank).contains(rank) else {
            throw BoardError.invalidRank(rank)
        }
        return status[rank.asIndex]
    }

    func pieceCount<P: Piece>(for pieceType: P.Type) -> (black: Int, white: Int) {
        let existingPieces = status
            .flatMap { $0.compactMap { $0 } }
            .filter { $0 is P }

        var pieces = (black: 0, white: 0)

        existingPieces.forEach { piece in
            switch piece.color {
            case .black:
                pieces.black += 1

            case .white:
                pieces.white += 1
            }
        }

        return pieces
    }
}
