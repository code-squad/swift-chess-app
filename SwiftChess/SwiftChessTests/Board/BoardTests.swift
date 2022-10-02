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

    // MARK: - 초기화

    func test_흑색Pawn의최초생성위치는_2rank이다() throws {
        let expectedPieceColor = PieceColor.black
        let secondRank = sut?.status[1]

        secondRank?.forEach { piece in
            guard let piece = piece as? Pawn else {
                return XCTFail("Pawn 타입이 아닙니다.")
            }
            XCTAssertEqual(piece.color, expectedPieceColor)
        }
    }

    func test_백색Pawn의최초생성위치는_7rank이다() throws {
        let expectedPieceColor = PieceColor.white
        let secondRank = sut?.status[6]

        secondRank?.forEach { piece in
            guard let piece = piece as? Pawn else {
                return XCTFail("Pawn 타입이 아닙니다.")
            }
            XCTAssertEqual(piece.color, expectedPieceColor)
        }
    }

    func test_색상별최초Pawn의생성개수는_8개이다() {
        let expectedPawnCount = 8
        let existingPawns = sut?.pieceCount(for: Pawn.self)

        XCTAssertEqual(existingPawns?.black, expectedPawnCount)
        XCTAssertEqual(existingPawns?.white, expectedPawnCount)
    }

    // MARK: - 점수 측정

    func test_체스판초기화후_점수를측정하면_각진영의점수는0이다() {
        let expectedPoints = (black: 0, white: 0)

        let currentPoints = sut?.currentPoints()

        XCTAssertEqual(currentPoints?.black, expectedPoints.black)
        XCTAssertEqual(currentPoints?.white, expectedPoints.white)
    }

    func test_각진영에Pawn이하나씩남아있을때_점수를측정하면_모든진영의점수는7이다() {
        let sut = Board(status: Self.topLeftEngagedPawnsMock)
        let expectedPoint = 7

        let currentPoints = sut.currentPoints()

        XCTAssertEqual(currentPoints.black, expectedPoint)
        XCTAssertEqual(currentPoints.white, expectedPoint)
    }

    func test_체스판에말이없을때_점수를측정하면_각진영모두최대점수이다() {
        let sut = Board(status: Self.emptyMock)
        let expectedPoint = Board.Configuration.totalAvailablePoints

        let currentPoints = sut.currentPoints()

        XCTAssertEqual(currentPoints.black, expectedPoint)
        XCTAssertEqual(currentPoints.white, expectedPoint)
    }

    // MARK: - 이동

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

    func test_Pawn이상대진영의끝으로이동하면_이동할수있는곳이없다() {
        let whitePawn = Pawn(color: .white)
        let movableLocations = whitePawn.movableLocations(from: .A1)

        XCTAssertTrue(movableLocations.isEmpty)
    }

    func test_흑색진영이백색Pawn을잡으면_흑색진영이1점을얻는다() throws {
        let sut = Board(status: Self.topLeftEngagedPawnsMock)
        let initialPawnCounts = sut.pieceCount(for: Pawn.self)
        let initialPoints = sut.currentPoints()
        XCTAssertEqual(initialPawnCounts.black, 1)
        XCTAssertEqual(initialPawnCounts.white, 1)
        XCTAssertEqual(initialPoints.black, 7)
        XCTAssertEqual(initialPoints.white, 7)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A2)
        try sut.move(with: moveCommand)

        let currentPawnCounts = sut.pieceCount(for: Pawn.self)
        let currentPoints = sut.currentPoints()
        XCTAssertEqual(currentPawnCounts.black, initialPawnCounts.black)
        XCTAssertEqual(currentPawnCounts.white, initialPawnCounts.white - 1)
        XCTAssertEqual(currentPoints.black, initialPoints.black + 1)
        XCTAssertEqual(currentPoints.white, initialPoints.white)
    }

    func test_백색진영이흑색Pawn을잡으면_백색진영이1점을얻는다() throws {
        let sut = Board(status: Self.topLeftEngagedPawnsMock)
        let initialPawnCounts = sut.pieceCount(for: Pawn.self)
        let initialPoints = sut.currentPoints()
        XCTAssertEqual(initialPawnCounts.black, 1)
        XCTAssertEqual(initialPawnCounts.white, 1)
        XCTAssertEqual(initialPoints.black, 7)
        XCTAssertEqual(initialPoints.white, 7)

        let moveCommand = MoveCommand(startPoint: .A2, endPoint: .A1)
        try sut.move(with: moveCommand)

        let currentPawnCounts = sut.pieceCount(for: Pawn.self)
        let currentPoints = sut.currentPoints()
        XCTAssertEqual(currentPawnCounts.black, initialPawnCounts.black - 1)
        XCTAssertEqual(currentPawnCounts.white, initialPawnCounts.white)
        XCTAssertEqual(currentPoints.black, initialPoints.black)
        XCTAssertEqual(currentPoints.white, initialPoints.white + 1)
    }

    func test_출발점과도착점이동일하면_이동시킬수없다() {
        let sut = Board(status: Self.topLeftWhitePawnMock)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A1)
        XCTAssertThrowsError(try sut.move(with: moveCommand)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .startEndPointShouldNotBeIdentical
            )
        }
    }

    func test_출발점에체스말이없으면_이동시킬수없다() {
        let sut = Board(status: Self.emptyMock)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A2)
        XCTAssertThrowsError(try sut.move(with: moveCommand)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .pieceNotExistsAtStartPoint(.A1)
            )
        }
    }

    func test_같은색상의말이도착점에있으면_이동할수없다() {
        let sut = Board(status: Self.topLeftBlockedPawnsMock)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A2)
        XCTAssertThrowsError(try sut.move(with: moveCommand)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .identicalColoredPieceAlreadyExists(endPoint: .A2)
            )
        }
    }

    // MARK: - 출력

    func test_보드초기화후_체스판을그래픽으로나타내면_예상한대로출력된다() {
        let expectedGraphicalRepresentation = """
        ........
        ♟♟♟♟♟♟♟♟
        ........
        ........
        ........
        ........
        ♙♙♙♙♙♙♙♙
        ........
        """

        let currentGraphicalRepresentation = sut?.display()

        XCTAssertEqual(currentGraphicalRepresentation, expectedGraphicalRepresentation)
    }
}

extension Board {

    func pieceCount<P: Piece>(for pieceType: P.Type) -> (black: Int, white: Int) {
        let existingPieces = status
            .flatMap { $0.compactMap { $0 } }
            .filter { $0 is P }

        var pieces = (black: 0, white: 0)

        existingPieces.forEach { piece in
            guard let piece = piece as? Piece else {
                XCTFail("\(Piece.self) 타입이 아닙니다. 타입을 다시 확인해주세요.")
                return
            }

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
