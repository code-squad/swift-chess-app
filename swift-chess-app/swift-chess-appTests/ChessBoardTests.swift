//
//  ChessBoardTest.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/26.
//

import XCTest
@testable import swift_chess_app

class ChessBoardTests: XCTestCase {
    
    var chessBrain: ChessBrain!
    
    var sut: ChessBoard! { chessBrain.board }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        chessBrain = .init(
            user1: ChessUser(name: "test1", color: .white),
            user2: ChessUser(name: "test2", color: .black)
        )
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        chessBrain = .init(
            user1: ChessUser(name: "test1", color: .white),
            user2: ChessUser(name: "test2", color: .black)
        )
    }
    
    func test_move_when_movable() {
        // given
        let pawn = Pawn(color: .white, point: ChessPoint(string: "A2")!)
        let pieces: [ChessPiece] = [pawn]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(ChessPoint(string: "A2")!, to: ChessPoint(string: "A3")!)
        
        // then
        XCTAssertTrue(canMove)
        XCTAssertNil(sut.data[ChessPoint(string: "A2")!])
        XCTAssertNotNil(sut.data[ChessPoint(string: "A3")!])
        XCTAssertEqual(sut.data[ChessPoint(string: "A3")!]!.color, pawn.color)
    }
    
    func test_move_when_unmovable() {
        // given
        let pawn1 = Pawn(color: .white, point: ChessPoint(string: "A2")!)
        let pawn2 = Pawn(color: .white, point: ChessPoint(string: "A3")!)
        let pieces: [ChessPiece] = [pawn1, pawn2]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(ChessPoint(string: "A2")!, to: ChessPoint(string: "A3")!)
        
        // then
        XCTAssertFalse(canMove)
    }
    
    func test_move_when_capturable() {
        // given
        let blackPawn = Pawn(color: .black, point: ChessPoint(string: "A2")!)
        let whitePawn = Pawn(color: .white, point: ChessPoint(string: "A3")!)
        let pieces: [ChessPiece] = [blackPawn, whitePawn]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(ChessPoint(string: "A2")!, to: ChessPoint(string: "A3")!)
        
        // then
        XCTAssertTrue(canMove)
        XCTAssertNil(sut.data[ChessPoint(string: "A2")!])
        XCTAssertNotNil(sut.data[ChessPoint(string: "A3")!])
        XCTAssertEqual(sut.data[ChessPoint(string: "A3")!]!.color, .black)
    }
    
    func test_black_pawn_count() {
        // given
        let pieceColor: ChessPieceColor = .black

        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in piece.color == pieceColor }
            .count

        // then
        XCTAssertEqual(result, 8)
    }
    
    func test_white_pawn_count() {
        // given
        let pieceColor: ChessPieceColor = .white

        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in piece.color == pieceColor }
            .count

        // then
        XCTAssertEqual(result, 8)
    }
    
    
    func test_1and2rank_color_is_black() {
        // given
        let pieceColor: ChessPieceColor = .black
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in point.rank.num == 1 || point.rank.num == 2 }
            .reduce(true) { partial, keyValue -> Bool in
                let (_, piece) = keyValue
                return partial && (piece.color == pieceColor)
            }
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_7and8rank_color_is_white() {
        // given
        let pieceColor: ChessPieceColor = .white
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (point, piece) in point.rank.num == 7 || point.rank.num == 8 }
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
            .sorted { lhs, rhs in
                if lhs.rank.num == rhs.rank.num {
                    return lhs.file.rawValue < rhs.file.rawValue
                }
                return lhs.rank.num < rhs.rank.num
            }
        
        // then
        XCTAssertEqual(result, [
            ChessPoint(string: "A2"),
            ChessPoint(string: "B2"),
            ChessPoint(string: "C2"),
            ChessPoint(string: "D2"),
            ChessPoint(string: "E2"),
            ChessPoint(string: "F2"),
            ChessPoint(string: "G2"),
            ChessPoint(string: "H2"),
            
            ChessPoint(string: "A7"),
            ChessPoint(string: "B7"),
            ChessPoint(string: "C7"),
            ChessPoint(string: "D7"),
            ChessPoint(string: "E7"),
            ChessPoint(string: "F7"),
            ChessPoint(string: "G7"),
            ChessPoint(string: "H7"),
        ].compactMap { $0 })
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
        let pawnColor: ChessPieceColor = .white
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (_, piece) in piece is Pawn }
            .filter { (_, piece) in piece.color == pawnColor }
        
        XCTAssertEqual(result.count, 8)
    }
    
    func test_black_pawn_count_after_prepare_pawns() {
        
        // given
        let pawnColor: ChessPieceColor = .black
        
        // when
        chessBrain.start()
        let result = sut.data
            .filter { (_, piece) in piece is Pawn }
            .filter { (_, piece) in piece.color == pawnColor }
        
        XCTAssertEqual(result.count, 8)
    }
    
    func test_white_color_score() {
        // given
        let pieceColor: ChessPieceColor = .white
        let scoreOption: ScoreManager.ScoreOptions = [.white]
        
        // when
        chessBrain.start()
        let whiteColorScore = sut.calculateScore(color: pieceColor, option: scoreOption)
        
        // then
        XCTAssertEqual(whiteColorScore, 8)
    }
    
    func test_black_color_score() {
        // given
        let pieceColor: ChessPieceColor = .black
        let scoreOption: ScoreManager.ScoreOptions = [.black]
        
        // when
        chessBrain.start()
        let blackColorScore = sut.calculateScore(color: pieceColor, option: scoreOption)
        
        // then
        XCTAssertEqual(blackColorScore, 8)
    }
}
