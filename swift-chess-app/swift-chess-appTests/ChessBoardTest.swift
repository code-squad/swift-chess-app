//
//  ChessBoardTest.swift
//  swift-chess-appTests
//
//  Created by USER on 2022/09/27.
//

import XCTest
@testable import swift_chess_app


class ChessBoardTest: XCTestCase {
    let chessBoard = ChessBoard()
    
    override func setUpWithError() throws {
        let startPositionOfBlackPawns = ChessGame.startPositionOfBlackPawns()
        let startPositionOfWhitePawns = ChessGame.startPositionOfWhitePawns()
        
        chessBoard.createPawns(color: .black, positions: startPositionOfBlackPawns)
        chessBoard.createPawns(color: .white, positions: startPositionOfWhitePawns)
    }
    
    func test_블랙_플레이어_Pawns() {
        //given
        let blackPawns = ChessGame.startPositionOfBlackPawns().map({ Pawn(color: .black, position: $0) })
        //when
        let blackPawnsInBoard = chessBoard.myPawns(color: .black)
        //then
         XCTAssertEqual(blackPawns, blackPawnsInBoard)
    }
    
    func test_화이트_플레이어_Pawns() {
        //given
        let whitePawns = ChessGame.startPositionOfWhitePawns().map({ Pawn(color: .white, position: $0) })
        //when
        let whitePawnsInBoard = chessBoard.myPawns(color: .white)
        //then
        XCTAssertEqual(whitePawns, whitePawnsInBoard)
    }
    
    func test_해당_위치에_존재하는_Pawn_이동_A7_To_A1() {
        //given
        let fromPosition = Position(file: .a, rank: .seven)
        let toPosition = Position(file: .a, rank: .one)
        //when
        let result = chessBoard.movePawn(color: .white, from: fromPosition, to: toPosition)
        //then
        XCTAssertTrue(result)
        XCTAssertNotNil(chessBoard.findPawn(color: .white, position: toPosition))
    }
    
    func test_해당_위치에_존재하는않는_Pawn_이동_A3_To_D3() {
        //given
        let fromPosition = Position(file: .a, rank: .three)
        let toPosition = Position(file: .d, rank: .three)
        //when
        let result = chessBoard.movePawn(color: .white, from: fromPosition, to: toPosition)
        //then
        XCTAssertFalse(result)
        XCTAssertNil(chessBoard.findPawn(color: .white, position: toPosition))
    }
    
    func test_Pawn_삭제() {
        //given
        let removePawn = chessBoard.myPawns(color: .black).randomElement()!
        //when
        let result = chessBoard.removePawn(color: .black, pawn: removePawn)!
        //then
        XCTAssertNil(chessBoard.findPawn(color: .black, position: result.position))
    }
    
    func test_상대_Pawn_Hit() {
        //given
        let targetPawn = chessBoard.myPawns(color: .black).randomElement()!
        //when
        let result = chessBoard.checkHitPawn(color: .white, position: targetPawn.position)
        //then
        XCTAssertNotNil(result)
    }
    
    func test_상대_Pawn_Not_Hit() {
        //given
        let hitPosition = Position(file: .a, rank: .three)
        //when
        let result = chessBoard.checkHitPawn(color: .white, position: hitPosition)
        //then
        XCTAssertNil(result)
    }
    
    func test_Display_Not_Assert() {
        let whitePawn1 = chessBoard.myPawns(color: .white).first!
        let whitePawn2 = chessBoard.myPawns(color: .white).last!
        chessBoard.movePawn(color: .white, from: whitePawn1.position, to: Position(file: .a, rank: .one))
        chessBoard.movePawn(color: .white, from: whitePawn2.position, to: Position(file: .d, rank: .six))
        
        let blackPawn1 = chessBoard.myPawns(color: .black).first!
        let blackPawn2 = chessBoard.myPawns(color: .black).last!
        chessBoard.movePawn(color: .black, from: blackPawn1.position, to: Position(file: .g, rank: .one))
        chessBoard.movePawn(color: .black, from: blackPawn2.position, to: Position(file: .e, rank: .six))

        chessBoard.display()
    //   1♙.....♟.
    //   2.♟♟♟♟♟♟.
    //   3........
    //   4........
    //   5........
    //   6...♙♟...
    //   7.♙♙♙♙♙♙.
    //   8........
    //    ABCDEFGH
    }
}
