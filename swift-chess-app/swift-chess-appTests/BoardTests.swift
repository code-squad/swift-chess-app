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
    
    func test_move_when_movable() {
        // given
        let pawn = Pawn(color: .white, point: Point(string: "A2")!)
        let pieces: [Piece] = [pawn]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(Point(string: "A2")!, to: Point(string: "A3")!)
        
        // then
        XCTAssertTrue(canMove)
        XCTAssertNil(sut.data[Point(string: "A2")!])
        XCTAssertNotNil(sut.data[Point(string: "A3")!])
        XCTAssertEqual(sut.data[Point(string: "A3")!]!.color, pawn.color)
    }
    
    func test_move_when_unmovable() {
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
    
    func test_move_when_capturable() {
        // given
        let blackPawn = Pawn(color: .black, point: Point(string: "A2")!)
        let whitePawn = Pawn(color: .white, point: Point(string: "A3")!)
        let pieces: [Piece] = [blackPawn, whitePawn]
        
        // when
        sut.set(pieces: pieces)
        let canMove = sut.move(Point(string: "A2")!, to: Point(string: "A3")!)
        
        // then
        XCTAssertTrue(canMove)
        XCTAssertNil(sut.data[Point(string: "A2")!])
        XCTAssertNotNil(sut.data[Point(string: "A3")!])
        XCTAssertEqual(sut.data[Point(string: "A3")!]!.color, .black)
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
        XCTAssertEqual(result, 8)
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
        XCTAssertEqual(result, 8)
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
            .sorted { lhs, rhs in
                if lhs.rank.rawValue == rhs.rank.rawValue {
                    return lhs.file.rawValue < rhs.file.rawValue
                }
                return lhs.rank.rawValue < rhs.rank.rawValue
            }
        
        // then
        XCTAssertEqual(result, [
            Point(string: "A2"),
            Point(string: "B2"),
            Point(string: "C2"),
            Point(string: "D2"),
            Point(string: "E2"),
            Point(string: "F2"),
            Point(string: "G2"),
            Point(string: "H2"),
            
            Point(string: "A7"),
            Point(string: "B7"),
            Point(string: "C7"),
            Point(string: "D7"),
            Point(string: "E7"),
            Point(string: "F7"),
            Point(string: "G7"),
            Point(string: "H7"),
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
        let pieceColor: Piece.Color = .white
        let scoreOption: ScoreManager.ScoreOptions = [.white]
        
        // when
        chessBrain.start()
        let whiteColorScore = sut.calculateScore(color: pieceColor, option: scoreOption)
        
        // then
        XCTAssertEqual(whiteColorScore, 8)
    }
    
    func test_black_color_score() {
        // given
        let pieceColor: Piece.Color = .black
        let scoreOption: ScoreManager.ScoreOptions = [.black]
        
        // when
        chessBrain.start()
        let blackColorScore = sut.calculateScore(color: pieceColor, option: scoreOption)
        
        // then
        XCTAssertEqual(blackColorScore, 8)
    }
}
