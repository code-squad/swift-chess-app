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

    func test_체스판초기화후_점수를측정하면_각진영의점수는0이다() {
        let expectedPoints = (black: 0, white: 0)

        let currentPoints = sut?.currentPoints()

        XCTAssertEqual(currentPoints?.black, expectedPoints.black)
        XCTAssertEqual(currentPoints?.white, expectedPoints.white)
    }

    func test_각진영에Pawn이하나씩남아있을때_점수를측정하면_모든진영의점수는7이다() {
        let sut = Board(status: BoardTesting.topLeftEngagedPawnsMock)
        let expectedPoint = 7

        let currentPoints = sut.currentPoints()

        XCTAssertEqual(currentPoints.black, expectedPoint)
        XCTAssertEqual(currentPoints.white, expectedPoint)
    }

    func test_체스판에말이없을때_점수를측정하면_각진영모두최대점수이다() {
        let sut = Board(status: BoardTesting.emptyMock)
        let expectedPoint = Board.Configuration.totalAvailablePoints

        let currentPoints = sut.currentPoints()

        XCTAssertEqual(currentPoints.black, expectedPoint)
        XCTAssertEqual(currentPoints.white, expectedPoint)
    }

    func test_흑색Pawn은_rank가늘어나는방향으로한칸만이동할수있다() {
        let blackPawn = Pawn(color: .black)
        let movableLocations = blackPawn.movableLocations(from: .D4)

        XCTAssertEqual(movableLocations.count, 1)
        XCTAssertEqual(movableLocations.first, .D5)
    }

    func test_백색Pawn은_rank가줄어드는방향으로한칸만이동할수있다() {
        let whitePawn = Pawn(color: .white)
        let movableLocations = whitePawn.movableLocations(from: .D5)

        XCTAssertEqual(movableLocations.count, 1)
        XCTAssertEqual(movableLocations.first, .D4)
    }

    func test_흑색진영이백색Pawn을잡으면_흑색진영이1점을얻는다() throws {
        let sut = Board(status: BoardTesting.topLeftEngagedPawnsMock)
        let initialPawnCounts = sut.pieceCount(for: Pawn.self)
        let initialPoints = sut.currentPoints()
        XCTAssertEqual(initialPawnCounts.black, 1)
        XCTAssertEqual(initialPawnCounts.white, 1)
        XCTAssertEqual(initialPoints.black, 7)
        XCTAssertEqual(initialPoints.white, 7)

        try sut.move(from: .A1, to: .A2)

        let currentPawnCounts = sut.pieceCount(for: Pawn.self)
        let currentPoints = sut.currentPoints()
        XCTAssertEqual(currentPawnCounts.black, initialPawnCounts.black)
        XCTAssertEqual(currentPawnCounts.white, initialPawnCounts.white - 1)
        XCTAssertEqual(currentPoints.black, initialPoints.black + 1)
        XCTAssertEqual(currentPoints.white, initialPoints.white)
    }

    func test_백색진영이흑색Pawn을잡으면_백색진영이1점을얻는다() throws {
        let sut = Board(status: BoardTesting.topLeftEngagedPawnsMock)
        let initialPawnCounts = sut.pieceCount(for: Pawn.self)
        let initialPoints = sut.currentPoints()
        XCTAssertEqual(initialPawnCounts.black, 1)
        XCTAssertEqual(initialPawnCounts.white, 1)
        XCTAssertEqual(initialPoints.black, 7)
        XCTAssertEqual(initialPoints.white, 7)

        try sut.move(from: .A2, to: .A1)

        let currentPawnCounts = sut.pieceCount(for: Pawn.self)
        let currentPoints = sut.currentPoints()
        XCTAssertEqual(currentPawnCounts.black, initialPawnCounts.black - 1)
        XCTAssertEqual(currentPawnCounts.white, initialPawnCounts.white)
        XCTAssertEqual(currentPoints.black, initialPoints.black)
        XCTAssertEqual(currentPoints.white, initialPoints.white + 1)
    }

    func test_Pawn이상대진영의끝으로이동하면_이동할수있는곳이없다() {
        let whitePawn = Pawn(color: .white)
        let movableLocations = whitePawn.movableLocations(from: .A1)

        XCTAssertTrue(movableLocations.isEmpty)
    }

    func test_체스판안에있지않은출발점을지정하면_이동시킬수없다() {
        let sut = Board(status: BoardTesting.topLeftBlackPawnMock)

        XCTAssertThrowsError(try sut.move(from: .A0, to: .A1)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .invalidStartPoint(.A0)
            )
        }
    }

    func test_체스판안에있지않은목적지를지정하면_이동시킬수없다() {
        let sut = Board(status: BoardTesting.topLeftWhitePawnMock)

        XCTAssertThrowsError(try sut.move(from: .A1, to: .A0)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .invalidEndPoint(.A0)
            )
        }
    }

    func test_출발점과목적지가동일하면_이동시킬수없다() {
        let sut = Board(status: BoardTesting.topLeftWhitePawnMock)

        XCTAssertThrowsError(try sut.move(from: .A1, to: .A1)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .startEndPointShouldNotBeIdentical
            )
        }
    }

    func test_출발점에체스말이없으면_이동시킬수없다() {
        let sut = Board(status: BoardTesting.emptyMock)

        XCTAssertThrowsError(try sut.move(from: .A1, to: .A2)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .pieceNotExistsAtStartPoint(.A1)
            )
        }
    }

    func test_같은색상의말이목적지에있으면_이동할수없다() {
        let sut = Board(status: BoardTesting.topLeftBlockedPawnsMock)

        XCTAssertThrowsError(try sut.move(from: .A1, to: .A2)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .identicalColoredPieceAlreadyExists(endPoint: .A2)
            )
        }
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
