//
//  ChessBoardTest.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/26.
//

import XCTest
@testable import swift_chess_app

class BoardTests: XCTestCase {
    
    var chessBrain: ChessBrain!
    
    var sut: Board! { chessBrain.board }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let inputManager = InputManager()
        chessBrain = .init(
            user1: User(name: "test1", color: .white, controller: inputManager),
            user2: User(name: "test2", color: .black, controller: inputManager)
        )
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        let inputManager = InputManager()
        chessBrain = .init(
            user1: User(name: "test1", color: .white, controller: inputManager),
            user2: User(name: "test2", color: .black, controller: inputManager)
        )
    }
    
    func test_move_when_pawn_movable() {
        // given
        let pawn = Pawn(color: .white, point: Point(string: "A2")!)
        let pieces: [Piece] = [pawn]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(Point(string: "A2")!, to: Point(string: "A1")!)
        
        // then
        XCTAssertTrue(canMove)
        XCTAssertNil(sut.toPiece(Point(string: "A2")!))
        XCTAssertNotNil(sut.toPiece(Point(string: "A1")!))
        XCTAssertEqual(sut.toPiece(Point(string: "A1")!)!.color, pawn.color)
    }
    
    func test_move_when_pawn_unmovable() {
        // given
        let pawn1 = Pawn(color: .white, point: Point(string: "A2")!)
        let pawn2 = Pawn(color: .white, point: Point(string: "A3")!)
        let pieces: [Piece] = [pawn1, pawn2]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(Point(string: "A2")!, to: Point(string: "A3")!)
        
        // then
        XCTAssertFalse(canMove)
    }
    
    func test_capture_when_pawn_capturable() {
        // given
        let blackPawn = Pawn(color: .black, point: Point(string: "A2")!)
        let whitePawn = Pawn(color: .white, point: Point(string: "A3")!)
        
        // when
        sut.set(pieces: [blackPawn, whitePawn])
        let canCapture = sut.capture(Point(string: "A3")!, by: Point(string: "A2")!)
        
        // then
        XCTAssertTrue(canCapture)
        XCTAssertNil(sut.toPiece(Point(string: "A2")!))
        XCTAssertNotNil(sut.toPiece(Point(string: "A3")!))
        XCTAssertEqual(sut.toPiece(Point(string: "A3")!)!.color, .black)
    }
    
    func test_movablePoints_for_rook() {
        // given
        let blackRook = Rook(color: .black, point: Point(string: "A1")!)
        let blackBishop = Bishop(color: .black, point: Point(string: "C1")!)
        
        // when
        sut.set(pieces: [blackRook, blackBishop])
        let movablePoints = sut.movablePoints(blackRook).sortedByFile
        
        // then
        XCTAssertEqual(movablePoints, [
            Point(string: "A2")!,
            Point(string: "A3")!,
            Point(string: "A4")!,
            Point(string: "A5")!,
            Point(string: "A6")!,
            Point(string: "A7")!,
            Point(string: "A8")!,
            Point(string: "B1")!,
        ])
    }
    
    func test_movablePoints_for_bishop() {
        // given
        let blackBishop = Bishop(color: .black, point: Point(string: "F1")!)
        let blackPawn1 = Pawn(color: .black, point: Point(string: "E2")!)
        let blackPawn2 = Pawn(color: .black, point: Point(string: "G2")!)
        
        // when
        sut.set(pieces: [blackBishop, blackPawn1, blackPawn2])
        let movablePoints = sut.movablePoints(blackBishop)
        
        // then
        XCTAssertEqual(movablePoints, [])
    }
    
    func test_movablePoints_for_knight() {
        // given
        let blackKnight = Knight(color: .black, point: Point(string: "A4")!)
        
        // when
        sut.set(pieces: [blackKnight])
        let movablePoints = sut.movablePoints(blackKnight).sortedByFile
        
        // then
        XCTAssertEqual(movablePoints, [
            Point(string: "B2")!,
            Point(string: "B6")!,
            Point(string: "C3")!,
            Point(string: "C5")!,
        ])
    }
    
    func test_movablePoints_for_queen() {
        // given
        let blackQueen = Queen(color: .black, point: Point(string: "F1")!)
        let blackPawn1 = Pawn(color: .white, point: Point(string: "E2")!)
        let blackPawn2 = Pawn(color: .white, point: Point(string: "G2")!)
        
        // when
        sut.set(pieces: [blackQueen, blackPawn1, blackPawn2])
        let movablePoints = sut.movablePoints(blackQueen).sortedByFile
        
        // then
        XCTAssertEqual(movablePoints, [
            Point(string: "A1")!,
            Point(string: "B1")!,
            Point(string: "C1")!,
            Point(string: "D1")!,
            Point(string: "E1")!,
            Point(string: "E2")!,
            Point(string: "F2")!,
            Point(string: "F3")!,
            Point(string: "F4")!,
            Point(string: "F5")!,
            Point(string: "F6")!,
            Point(string: "F7")!,
            Point(string: "F8")!,
            Point(string: "G1")!,
            Point(string: "G2")!,
            Point(string: "H1")!,
        ])
    }
    
    
    
    func test_black_pawn_count() {
        // given
        let pieceColor: Piece.Color = .black

        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in piece.color == pieceColor }
            .count

        // then
        XCTAssertEqual(result, 15)
    }
    
    func test_white_pawn_count() {
        // given
        let pieceColor: Piece.Color = .white

        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in piece.color == pieceColor }
            .count

        // then
        XCTAssertEqual(result, 15)
    }
    
    
    func test_1and2rank_color_is_black() {
        // given
        let pieceColor: Piece.Color = .black
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in point.rank.rawValue == 1 || point.rank.rawValue == 2 }
            .reduce(true) { partial, keyValue -> Bool in
                let (_, piece) = keyValue
                return partial && (piece.color == pieceColor)
            }
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_7and8rank_color_is_white() {
        // given
        let pieceColor: Piece.Color = .white
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in point.rank.rawValue == 7 || point.rank.rawValue == 8 }
            .reduce(true) { partial, keyValue -> Bool in
                let (_, piece) = keyValue
                return partial && (piece.color == pieceColor)
            }
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_pawn_points_after_prepare_pawns() {
        // given
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (_, piece) in piece is Pawn }
            .map { $0.key }
            .sortedByFile
        
        // then
        XCTAssertEqual(result, [
            Point(string: "A2")!,
            Point(string: "A7")!,
            Point(string: "B2")!,
            Point(string: "B7")!,
            Point(string: "C2")!,
            Point(string: "C7")!,
            Point(string: "D2")!,
            Point(string: "D7")!,
            Point(string: "E2")!,
            Point(string: "E7")!,
            Point(string: "F2")!,
            Point(string: "F7")!,
            Point(string: "G2")!,
            Point(string: "G7")!,
            Point(string: "H2")!,
            Point(string: "H7")!,
        ])
    }
    
    func test_pawn_count_after_prepare_pawns() {
        
        // given
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (_, piece) in piece is Pawn }
        
        XCTAssertEqual(result.count, 16)
    }
    
    func test_white_pawn_count_after_prepare_pawns() {
        
        // given
        let pawnColor: Piece.Color = .white
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (_, piece) in piece is Pawn }
            .filter { (_, piece) in piece.color == pawnColor }
        
        XCTAssertEqual(result.count, 8)
    }
    
    func test_black_pawn_count_after_prepare_pawns() {
        
        // given
        let pawnColor: Piece.Color = .black
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (_, piece) in piece is Pawn }
            .filter { (_, piece) in piece.color == pawnColor }
        
        XCTAssertEqual(result.count, 8)
    }
    
    func test_white_color_score() {
        // given
        let scoreOption: ScoreManager.ScoreOptions = [.white]
        
        // when
        chessBrain.start()
        let whiteColorScore = sut.calculateScore(option: scoreOption)
        
        // then
        XCTAssertEqual(whiteColorScore, 39)
    }
    
    func test_black_color_score() {
        // given
        let scoreOption: ScoreManager.ScoreOptions = [.black]
        
        // when
        chessBrain.start()
        let blackColorScore = sut.calculateScore(option: scoreOption)
        
        // then
        XCTAssertEqual(blackColorScore, 39)
    }
}
