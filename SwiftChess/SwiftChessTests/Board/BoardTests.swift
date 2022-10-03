//
//  BoardTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/09/28.
//

import XCTest
@testable import SwiftChess

final class BoardTests: XCTestCase {

    private var sut: DefaultBoard?

    override func setUp() {
        super.setUp()
        sut = DefaultBoard()
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
        let expectedPoints = GamePoint.zeros

        let currentPoints = sut?.currentPoints()

        XCTAssertEqual(currentPoints, expectedPoints)
    }

    func test_각진영에Pawn이하나씩남아있을때_점수를측정하면_모든진영의점수는7이다() {
        let sut = DefaultBoard(status: Self.topLeftEngagedPawnsMock)
        let expectedPoints = GamePoint(black: 7, white: 7)

        let currentPoints = sut.currentPoints()

        XCTAssertEqual(currentPoints, expectedPoints)
    }

    func test_체스판에말이없을때_점수를측정하면_각진영모두최대점수이다() {
        let sut = DefaultBoard(status: Self.emptyMock)
        let expectedPoints = GamePoint(
            black: DefaultBoard.Configuration.totalAvailablePoints,
            white: DefaultBoard.Configuration.totalAvailablePoints
        )

        let currentPoints = sut.currentPoints()

        XCTAssertEqual(currentPoints, expectedPoints)
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
        let sut = DefaultBoard(status: Self.topLeftEngagedPawnsMock)
        let expectedInitialPawnCount = 1
        let expectedInitialPoints = GamePoint(black: 7, white: 7)
        let initialPawnCounts = sut.pieceCount(for: Pawn.self)
        let initialPoints = sut.currentPoints()
        XCTAssertEqual(initialPawnCounts.black, expectedInitialPawnCount)
        XCTAssertEqual(initialPawnCounts.white, expectedInitialPawnCount)
        XCTAssertEqual(initialPoints, expectedInitialPoints)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A2)
        try sut.move(with: moveCommand)

        let expectedCurrentPoints = GamePoint(
            black: initialPoints.black + 1,
            white: initialPoints.white
        )
        let currentPawnCounts = sut.pieceCount(for: Pawn.self)
        let currentPoints = sut.currentPoints()
        XCTAssertEqual(currentPawnCounts.black, initialPawnCounts.black)
        XCTAssertEqual(currentPawnCounts.white, initialPawnCounts.white - 1)
        XCTAssertEqual(currentPoints, expectedCurrentPoints)
    }

    func test_백색진영이흑색Pawn을잡으면_백색진영이1점을얻는다() throws {
        let sut = DefaultBoard(status: Self.topLeftEngagedPawnsMock)
        let expectedInitialPawnCount = 1
        let expectedInitialPoints = GamePoint(black: 7, white: 7)
        let initialPawnCounts = sut.pieceCount(for: Pawn.self)
        let initialPoints = sut.currentPoints()
        XCTAssertEqual(initialPawnCounts.black, expectedInitialPawnCount)
        XCTAssertEqual(initialPawnCounts.white, expectedInitialPawnCount)
        XCTAssertEqual(initialPoints, expectedInitialPoints)

        let moveCommand = MoveCommand(startPoint: .A2, endPoint: .A1)
        try sut.move(with: moveCommand)

        let expectedCurrentPoints = GamePoint(
            black: initialPoints.black,
            white: initialPoints.white + 1
        )
        let currentPawnCounts = sut.pieceCount(for: Pawn.self)
        let currentPoints = sut.currentPoints()
        XCTAssertEqual(currentPawnCounts.black, initialPawnCounts.black - 1)
        XCTAssertEqual(currentPawnCounts.white, initialPawnCounts.white)
        XCTAssertEqual(currentPoints, expectedCurrentPoints)
    }

    func test_출발점과도착점이동일하면_이동시킬수없다() {
        let sut = DefaultBoard(status: Self.topLeftWhitePawnMock)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A1)
        XCTAssertThrowsError(try sut.move(with: moveCommand)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .startEndPointShouldNotBeIdentical
            )
        }
    }

    func test_출발점에체스말이없으면_이동시킬수없다() {
        let sut = DefaultBoard(status: Self.emptyMock)

        let moveCommand = MoveCommand(startPoint: .A1, endPoint: .A2)
        XCTAssertThrowsError(try sut.move(with: moveCommand)) { error in
            XCTAssertEqual(
                error as? BoardError,
                .pieceNotExistsAtStartPoint(.A1)
            )
        }
    }

    func test_같은색상의말이도착점에있으면_이동할수없다() {
        let sut = DefaultBoard(status: Self.topLeftBlockedPawnsMock)

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
         ABCDEFGH
        1........
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8........
         ABCDEFGH
        """

        let currentGraphicalRepresentation = sut?.display()

        XCTAssertEqual(currentGraphicalRepresentation, expectedGraphicalRepresentation)
    }

    func test_보드초기화후_display를호출하면_boardPrinter의메서드를한번호출한다() {
        var printFormattedBoardCallCount = 0
        let expectedCallCount = 1
        var boardPrinter: BoardPrinter = .unimplemented()
        boardPrinter.printFormattedBoard = { _ in
            printFormattedBoardCallCount += 1
            return ""
        }
        let sut = DefaultBoard(boardPrinter: boardPrinter)

        sut.display()

        XCTAssertEqual(printFormattedBoardCallCount, expectedCallCount)
    }

    // MARK: - Foundation

    func test_Rank의각케이스를Index로나타내면_rawValue보다1작다() {
        let allRanks = BoardLocation.Rank.allCases

        allRanks.forEach { rank in
            XCTAssertEqual(rank.index, rank.rawValue - 1)
        }
    }

    func test_File의각케이스를Index로나타내면_rawValue보다1작다() {
        let allFiles = BoardLocation.File.allCases

        allFiles.forEach { file in
            XCTAssertEqual(file.index, file.rawValue - 1)
        }
    }

    func test_Rank의최소RawValue는_1이다() {
        let expectedMinimumRankRawValue: Int = 1

        XCTAssertEqual(BoardLocation.Rank.minimumRawValue, expectedMinimumRankRawValue)
    }

    func test_Rank의최소Case는_one이다() {
        let expectedMinimumRankRawValue = BoardLocation.Rank.one

        XCTAssertEqual(BoardLocation.Rank.minimumCase, expectedMinimumRankRawValue)
    }

    func test_File의최소RawValue는_1이다() {
        let expectedMinimumFileRawValue: Int = 1

        XCTAssertEqual(BoardLocation.File.minimumRawValue, expectedMinimumFileRawValue)
    }

    func test_File의최소Case는_A이다() {
        let expectedMinimumFileRawValue = BoardLocation.File.A

        XCTAssertEqual(BoardLocation.File.minimumCase, expectedMinimumFileRawValue)
    }
}

extension DefaultBoard {

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
