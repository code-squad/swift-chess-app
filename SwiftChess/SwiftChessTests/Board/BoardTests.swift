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
                return XCTFail("\(Pawn.self) 타입이 아닙니다.")
            }
            XCTAssertEqual(piece.color, expectedPieceColor)
        }
    }

    func test_색상별최초Pawn의생성개수는_8개이다() {
        let expectedPawnCount = 8
        let pawnCounts = sut?.pieceCount(for: Pawn.self)

        XCTAssertEqual(pawnCounts?.black, expectedPawnCount)
        XCTAssertEqual(pawnCounts?.white, expectedPawnCount)
    }

    func test_흑색Bishop의최초생성위치는_C1과F1이다() {
        let firstBishopLocation = BoardLocation(file: .C, rank: .one)
        let secondBishopLocation = BoardLocation(file: .F, rank: .one)

        guard let firstBishop = sut?[firstBishopLocation] as? Bishop else {
            return XCTFail("\(firstBishopLocation)에 있는 체스말은 \(Bishop.self) 타입이 아닙니다.")
        }
        guard let secondBishop = sut?[secondBishopLocation] as? Bishop else {
            return XCTFail("\(secondBishopLocation)에 있는 체스말은 \(Bishop.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(firstBishop.color, .black)
        XCTAssertEqual(secondBishop.color, .black)
    }

    func test_백색Bishop의최초생성위치는_C8과F8이다() {
        let firstBishopLocation = BoardLocation(file: .C, rank: .eight)
        let secondBishopLocation = BoardLocation(file: .F, rank: .eight)

        guard let firstBishop = sut?[firstBishopLocation] as? Bishop else {
            return XCTFail("\(firstBishopLocation)에 있는 체스말은 \(Bishop.self) 타입이 아닙니다.")
        }
        guard let secondBishop = sut?[secondBishopLocation] as? Bishop else {
            return XCTFail("\(secondBishopLocation)에 있는 체스말은 \(Bishop.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(firstBishop.color, .white)
        XCTAssertEqual(secondBishop.color, .white)
    }

    func test_색상별최초Bishop의생성개수는_2개이다() {
        let expectedBishopCount = 2
        let bishopCounts = sut?.pieceCount(for: Bishop.self)

        XCTAssertEqual(bishopCounts?.black, expectedBishopCount)
        XCTAssertEqual(bishopCounts?.white, expectedBishopCount)
    }

    func test_흑색Knight의최초생성위치는_B1과G1이다() {
        let firstKnightLocation = BoardLocation(file: .B, rank: .one)
        let secondKnightLocation = BoardLocation(file: .G, rank: .one)

        guard let firstKnight = sut?[firstKnightLocation] as? Knight else {
            return XCTFail("\(firstKnightLocation)에 있는 체스말은 \(Knight.self) 타입이 아닙니다.")
        }
        guard let secondKnight = sut?[secondKnightLocation] as? Knight else {
            return XCTFail("\(secondKnightLocation)에 있는 체스말은 \(Knight.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(firstKnight.color, .black)
        XCTAssertEqual(secondKnight.color, .black)
    }

    func test_백색Knight의최초생성위치는_B8과G8이다() {
        let firstKnightLocation = BoardLocation(file: .B, rank: .eight)
        let secondKnightLocation = BoardLocation(file: .G, rank: .eight)

        guard let firstKnight = sut?[firstKnightLocation] as? Knight else {
            return XCTFail("\(firstKnightLocation)에 있는 체스말은 \(Knight.self) 타입이 아닙니다.")
        }
        guard let secondKnight = sut?[secondKnightLocation] as? Knight else {
            return XCTFail("\(secondKnightLocation)에 있는 체스말은 \(Knight.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(firstKnight.color, .white)
        XCTAssertEqual(secondKnight.color, .white)
    }

    func test_색상별최초Knight의생성개수는_2개이다() {
        let expectedKnightCount = 2
        let knightCounts = sut?.pieceCount(for: Knight.self)

        XCTAssertEqual(knightCounts?.black, expectedKnightCount)
        XCTAssertEqual(knightCounts?.white, expectedKnightCount)
    }

    func test_흑색Queen의최초생성위치는_E1이다() {
        let queenLocation = BoardLocation(file: .E, rank: .one)

        guard let queen = sut?[queenLocation] as? Queen else {
            return XCTFail("\(queenLocation)에 있는 체스말은 \(Queen.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(queen.color, .black)
    }

    func test_백색Queen의최초생성위치는_E8이다() {
        let queenLocation = BoardLocation(file: .E, rank: .eight)

        guard let queen = sut?[queenLocation] as? Queen else {
            return XCTFail("\(queenLocation)에 있는 체스말은 \(Queen.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(queen.color, .white)
    }

    func test_색상별최초Queen의생성개수는_1개이다() {
        let expectedQueenCount = 1
        let queenCounts = sut?.pieceCount(for: Queen.self)

        XCTAssertEqual(queenCounts?.black, expectedQueenCount)
        XCTAssertEqual(queenCounts?.white, expectedQueenCount)
    }

    func test_흑색Rook의최초생성위치는_A1과H1이다() {
        let firstRookLocation = BoardLocation(file: .A, rank: .one)
        let secondRookLocation = BoardLocation(file: .H, rank: .one)

        guard let firstRook = sut?[firstRookLocation] as? Rook else {
            return XCTFail("\(firstRookLocation)에 있는 체스말은 \(Rook.self) 타입이 아닙니다.")
        }
        guard let secondRook = sut?[secondRookLocation] as? Rook else {
            return XCTFail("\(secondRookLocation)에 있는 체스말은 \(Rook.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(firstRook.color, .black)
        XCTAssertEqual(secondRook.color, .black)
    }

    func test_백색Rook의최초생성위치는_A8과H8이다() {
        let firstRookLocation = BoardLocation(file: .A, rank: .eight)
        let secondRookLocation = BoardLocation(file: .H, rank: .eight)

        guard let firstRook = sut?[firstRookLocation] as? Rook else {
            return XCTFail("\(firstRookLocation)에 있는 체스말은 \(Rook.self) 타입이 아닙니다.")
        }
        guard let secondRook = sut?[secondRookLocation] as? Rook else {
            return XCTFail("\(secondRookLocation)에 있는 체스말은 \(Rook.self) 타입이 아닙니다.")
        }
        XCTAssertEqual(firstRook.color, .white)
        XCTAssertEqual(secondRook.color, .white)
    }

    func test_색상별최초Rook의생성개수는_2개이다() {
        let expectedRookCount = 2
        let rookCounts = sut?.pieceCount(for: Rook.self)

        XCTAssertEqual(rookCounts?.black, expectedRookCount)
        XCTAssertEqual(rookCounts?.white, expectedRookCount)
    }

    // MARK: - 점수 측정

    func test_체스판초기화후_점수를측정하면_각진영의점수는0이다() {
        let expectedPoints = GamePoint.zeros

        let currentPoints = sut?.currentPoints()

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
        let expectedInitialPoints = GamePoint(black: 38, white: 38)
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
        let expectedInitialPoints = GamePoint(black: 38, white: 38)
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

    func test_상대방진영의말을잡으면_현재점수출력메서드가호출된다() throws {
        let expectedPrintCallCount = 1
        var actualPrintCallCount = 0
        let expectedPoints = GamePoint(black: 38, white: 39)
        var actualPoints: GamePoint?
        var boardPrinter: BoardPrinter = .unimplemented
        boardPrinter.printCurrentPoints = { currentPoints in
            actualPrintCallCount += 1
            actualPoints = currentPoints
            return ""
        }
        let sut = DefaultBoard(
            status: Self.topLeftEngagedPawnsMock,
            boardPrinter: boardPrinter
        )

        let moveCommand = MoveCommand(startPoint: .A2, endPoint: .A1)
        try sut.move(with: moveCommand)

        XCTAssertEqual(actualPrintCallCount, expectedPrintCallCount)
        XCTAssertEqual(actualPoints, expectedPoints)
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
        1♜♞♝.♛♝♞♜
        2♟♟♟♟♟♟♟♟
        3........
        4........
        5........
        6........
        7♙♙♙♙♙♙♙♙
        8♖♘♗.♕♗♘♖
         ABCDEFGH
        """

        let currentGraphicalRepresentation = sut?.display()

        XCTAssertEqual(currentGraphicalRepresentation, expectedGraphicalRepresentation)
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
        let expectedMinimumRankCase = BoardLocation.Rank.one

        XCTAssertEqual(BoardLocation.Rank.minimumCase, expectedMinimumRankCase)
    }

    func test_File의최소RawValue는_1이다() {
        let expectedMinimumFileRawValue: Int = 1

        XCTAssertEqual(BoardLocation.File.minimumRawValue, expectedMinimumFileRawValue)
    }

    func test_File의최소Case는_A이다() {
        let expectedMinimumFileCase = BoardLocation.File.A

        XCTAssertEqual(BoardLocation.File.minimumCase, expectedMinimumFileCase)
    }
}

extension DefaultBoard {

    func pieces<P: Piece>(for pieceType: P.Type) -> [Piece] {
        return status.flatMap { $0.compactMap { $0 as? P } }
    }

    func pieceCount(for pieceType: Piece.Type) -> (black: Int, white: Int) {
        let existingPieces = pieces(for: pieceType)
        let totalExistingPieceCount = existingPieces.count
        let blackPieceCount = existingPieces.filter({ $0.color == .black }).count
        return (
            black: blackPieceCount,
            white: totalExistingPieceCount - blackPieceCount
        )
    }
}
