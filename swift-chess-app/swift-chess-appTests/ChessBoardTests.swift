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
}
