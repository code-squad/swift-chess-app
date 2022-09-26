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
        chessGame.chessBoard.myPawns(color: .white).forEach({
            chessGame.chessBoard.removePawn(color: .white, pawn: $0)
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
        chessGame.chessBoard.myPawns(color: .white).enumerated().forEach({
            if $0 != 0 {
                chessGame.chessBoard.removePawn(color: .white, pawn: $1)
            }
        })
        let shouldContinueGame = chessGame.checkContinueGame()
        //then
        XCTAssertTrue(shouldContinueGame)
    }
    // // MARK: - 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
    func test_이동_가능한_경로_확인_흰색_A7_To_A6() {
        //given
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        let targetPawn = chessGame.chessBoard.findPawn(color: .white, position: Position(file: .a, rank: .seven))!
        let toPosition = Position(file: targetPawn.position.file, rank: Rank(rawValue: targetPawn.position.rank.rawValue - 1)!)
        //when
        let canMove = chessGame.checkValidatePosition(player: .white, from: targetPawn.position, to: toPosition)
        //then
        XCTAssertTrue(canMove)
    }
    
    func test_이동_가능한_경로_확인_흰색_A7_To_A5() {
        //given
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        let targetPawn = chessGame.chessBoard.findPawn(color: .white, position: Position(file: .a, rank: .seven))!
        let toPosition = Position(file: targetPawn.position.file, rank: Rank(rawValue: targetPawn.position.rank.rawValue - 2)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(player: .white, from: targetPawn.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_이동_가능한_경로_확인_흰색_A7_To_A8() {
        //given
        chessGame.chessBoard.createPawns(color: .white, positions: ChessGame.startPositionOfWhitePawns())
        let targetPawn = chessGame.chessBoard.findPawn(color: .white, position: Position(file: .a, rank: .seven))!
        let toPosition = Position(file: targetPawn.position.file, rank: Rank(rawValue: targetPawn.position.rank.rawValue + 1)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(player: .white, from: targetPawn.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    
    func test_이동_가능한_경로_확인_검은색_A2_To_A3() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let targetPawn = chessGame.chessBoard.findPawn(color: .black, position: Position(file: .a, rank: .two))!
        let toPosition = Position(file: targetPawn.position.file, rank: Rank(rawValue: targetPawn.position.rank.rawValue + 1)!)
        //when
        let canMove = chessGame.checkValidatePosition(player: .black, from: targetPawn.position, to: toPosition)
        //then
        XCTAssertTrue(canMove)
    }
    
    func test_이동_가능한_경로_확인_검은색_A2_To_A1() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let targetPawn = chessGame.chessBoard.findPawn(color: .black, position: Position(file: .a, rank: .two))!
        let toPosition = Position(file: targetPawn.position.file, rank: Rank(rawValue: targetPawn.position.rank.rawValue - 1)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(player: .black, from: targetPawn.position, to: toPosition)
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_이동_가능한_경로_확인_검은색_A2_To_A3_To_A1() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let targetPawn = chessGame.chessBoard.findPawn(color: .black, position: Position(file: .a, rank: .two))!
        let toPosition1 = Position(file: targetPawn.position.file, rank: Rank(rawValue: targetPawn.position.rank.rawValue + 1)!)
        chessGame.chessBoard.movePawn(color: .black, from: targetPawn.position, to: toPosition1)
        let toPosition2 = Position(file: toPosition1.file, rank: Rank(rawValue: toPosition1.rank.rawValue - 2)!)
        //when
        let canNotMove = chessGame.checkValidatePosition(player: .black, from: toPosition1, to: toPosition2)
        
        //then
        XCTAssertFalse(canNotMove)
    }
    
    func test_스코어_확인() {
        //given
        chessGame.chessBoard.createPawns(color: .black, positions: ChessGame.startPositionOfBlackPawns())
        let initScore = chessGame.chessBoard.myPawns(color: .black).count
        let removePawn1 = chessGame.chessBoard.myPawns(color: .black).first!
        let removePawn2 = chessGame.chessBoard.myPawns(color: .black).last!
        //when
        chessGame.chessBoard.removePawn(color: .black, pawn: removePawn1)
        chessGame.chessBoard.removePawn(color: .black, pawn: removePawn2)
        let score = initScore - 2
        //then
        
        XCTAssertEqual(score, 6)
    }
    
    func test_플레이어_턴_교환() {
        //given
        let prevTurnPlayer = chessGame.currentPalyer
        //when
        chessGame.changeTurnPalyer()
        let nowTurnPlayer = chessGame.currentPalyer
        //then
         XCTAssertNotEqual(prevTurnPlayer, nowTurnPlayer)
    }
}
