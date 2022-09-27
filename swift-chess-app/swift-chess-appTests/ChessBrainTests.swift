//
//  ChessBrainTests.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/26.
//

import XCTest
@testable import swift_chess_app

class ChessBrainTests: XCTestCase {
    
    var sut: ChessBrain!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .init(
            user1: ChessUser(name: "test1", color: .white),
            user2: ChessUser(name: "test2", color: .black)
        )
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = .init(
            user1: ChessUser(name: "test1", color: .white),
            user2: ChessUser(name: "test2", color: .black)
        )
    }
    
    func test_1and2rank_color_is_black() {
        // given
        let pieceColor: ChessPieceColor = .black
        
        // when
        sut.start()
        let result = sut.board.data
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
        sut.start()
        let result = sut.board.data
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
        sut.start()
        let result = sut.board.data
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
        sut.start()
        let result = sut.board.data
            .filter { (_, piece) in piece is Pawn }
        
        XCTAssertEqual(result.count, 16)
    }
    
    func test_white_pawn_count_after_prepare_pawns() {
        
        // given
        let pawnColor: ChessPieceColor = .white
        
        // when
        sut.start()
        let result = sut.board.data
            .filter { (_, piece) in piece is Pawn }
            .filter { (_, piece) in piece.color == pawnColor }
        
        XCTAssertEqual(result.count, 8)
    }
    
    func test_black_pawn_count_after_prepare_pawns() {
        
        // given
        let pawnColor: ChessPieceColor = .black
        
        // when
        sut.start()
        let result = sut.board.data
            .filter { (_, piece) in piece is Pawn }
            .filter { (_, piece) in piece.color == pawnColor }
        
        XCTAssertEqual(result.count, 8)
    }
}
