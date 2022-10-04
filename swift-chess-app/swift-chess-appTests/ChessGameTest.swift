//
//  ChessGameTest.swift
//  swift-chess-appTests
//
//  Created by USER on 2022/09/27.
//

import XCTest
@testable import swift_chess_app

class ChessGameTest: XCTestCase {
    let chessGame = ChessGame()
    
    func test_게임_종료() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        //when
        chessGame.chessBoard.myPieces(color: .white).forEach({
            chessGame.chessBoard.killChessPiece($0)
        })
        let shouldContinueGame = chessGame.checkContinueGame()
        //then
        XCTAssertFalse(shouldContinueGame)
    }
    
    func test_게임_Continue() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        //when
        chessGame.chessBoard.myPieces(color: .white).enumerated().forEach({
            if $0 != 0 {
                chessGame.chessBoard.killChessPiece($1)
            }
        })
        let shouldContinueGame = chessGame.checkContinueGame()
        //then
        XCTAssertTrue(shouldContinueGame)
    }
    
    func test_이동_가능한_경로_확인_흰색_A7_To_A6() {
        //given
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        let targetPiece = chessGame.chessBoard.myPieces(color: .white).first(where: { $0.position ==  Position(file: .a, rank: .seven) })!
        let toPosition = Position(file: targetPiece.position.file, rank: Rank(rawValue: targetPiece.position.rank.rawValue - 1)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(playerColor: .black, from: targetPiece.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_이동_가능한_경로_확인_흰색_A7_To_A5() {
        //given
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        let targetPiece = chessGame.chessBoard.myPieces(color: .white).first(where: { $0.position ==  Position(file: .a, rank: .seven) })!
        let toPosition = Position(file: targetPiece.position.file, rank: Rank(rawValue: targetPiece.position.rank.rawValue - 2)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(playerColor: .white, from: targetPiece.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_이동_가능한_경로_확인_흰색_A7_To_A8() {
        //given
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        let targetPiece = chessGame.chessBoard.myPieces(color: .white).first(where: { $0.position ==  Position(file: .a, rank: .seven) })!
        let toPosition = Position(file: targetPiece.position.file, rank: Rank(rawValue: targetPiece.position.rank.rawValue + 1)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(playerColor: .white, from: targetPiece.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    
    func test_이동_가능한_경로_확인_검은색_A2_To_A3() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let targetPiece = chessGame.chessBoard.myPieces(color: .black).first(where: { $0.position ==  Position(file: .a, rank: .two) })!
        let toPosition = Position(file: targetPiece.position.file, rank: Rank(rawValue: targetPiece.position.rank.rawValue + 1)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(playerColor: .black, from: targetPiece.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_이동_가능한_경로_확인_검은색_A2_To_A1() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let targetPiece = chessGame.chessBoard.myPieces(color: .black).first(where: { $0.position ==  Position(file: .a, rank: .two) })!
        let toPosition = Position(file: targetPiece.position.file, rank: Rank(rawValue: targetPiece.position.rank.rawValue - 1)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(playerColor: .black, from: targetPiece.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_이동_가능한_경로_확인_검은색_A2_To_A3_To_A1() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let targetPiece = chessGame.chessBoard.myPieces(color: .black).first(where: { $0.position ==  Position(file: .a, rank: .two) })!
        let toPosition1 = Position(file: targetPiece.position.file, rank: Rank(rawValue: targetPiece.position.rank.rawValue + 1)!)
        chessGame.chessBoard.movePiece(color: .black, from: targetPiece.position, to: toPosition1)
        let toPosition2 = Position(file: toPosition1.file, rank: Rank(rawValue: toPosition1.rank.rawValue - 2)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(playerColor: .black, from: toPosition1, to: toPosition2)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_스코어_확인() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        chessGame.chessBoard.createKnights(color: .black, positions: ChessGame.startPositionOfBlackKnights())
        let initScore = chessGame.chessBoard.myPieces(color: .black).map({ $0.point }).reduce(0, { $0 + $1 })
        let removePawn = chessGame.chessBoard.myPieces(color: .black).filter({ $0 is Pawn }).first!
        let removeKnight = chessGame.chessBoard.myPieces(color: .black).filter({ $0 is Knight }).first!
        //when
        chessGame.chessBoard.killChessPiece(removePawn)
        chessGame.chessBoard.killChessPiece(removeKnight)
        let score = initScore - Dimension.Point.pawn - Dimension.Point.knight
        //then
        
        XCTAssertEqual(score, chessGame.score())
    }
    
    func test_플레이어_턴_교환() {
        //given
        let prevTurnPlayer = chessGame.currentPalyerColor
        //when
        chessGame.changeTurnPalyer()
        let nowTurnPlayer = chessGame.currentPalyerColor
        //then
         XCTAssertNotEqual(prevTurnPlayer, nowTurnPlayer)
    }
}
