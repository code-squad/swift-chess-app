//
//  ChessGame.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

class ChessGame {
    typealias Player = Pawn.Color
    
    let chessBoard = ChessBoard()
    var currentPalyer: Player = .black
    
    func start(inputString: String) {
        chessBoard.createPawns(color: .black, positions: Self.startPositionOfBlackPawns())
        chessBoard.createPawns(color: .white, positions: Self.startPositionOfWhitePawns())
        
        while checkContinueGame() {
            guard let command = Command.make(inputString: inputString),
                  let from = command.fromPosition(),
                  let to = command.toPosition()
            else {
                printError(.invalidFormat)
                continue
            }
            
            guard checkValidatePosition(player: currentPalyer, from: from, to: to)
            else {
                printError(.invalidPosition)
                continue
            }
            
            guard chessBoard.movePawn(color: currentPalyer, from: from, to: to)
            else {
                printError(.notFindPawn)
                continue
            }
                
            if let removePawn = chessBoard.checkHitPawn(color: currentPalyer, position: to) {
                let otherPlayer: Player = currentPalyer == .black ? .white : .black
                chessBoard.removePawn(color: otherPlayer, pawn: removePawn)
            }
                
            chessBoard.display()
            changeTurnPalyer()
        }
    }
    
    func changeTurnPalyer() {
        let turnPalyer: Player = currentPalyer == .black ? .white : .black
        self.currentPalyer = turnPalyer
    }
    
    // MARK: - 백색은 큰 rank에서 더 작은 rank로 움직일 수 있고, 흑색은 작은 rank에서 더 큰 rank로 움직일 수 있다.
    func checkValidatePosition(player: Player, from: Position, to: Position) -> Bool {
        guard chessBoard.findPawn(color: player, position: to) == nil else { return false }
        
        let canDirectionToInt: Int = player == .white ? 1 : -1
        if ((from.file.rawValue == to.file.rawValue) && ((from.rank.rawValue - to.rank.rawValue) == canDirectionToInt))
            || ((abs(from.file.rawValue - to.file.rawValue) == 1) && (from.rank.rawValue == to.rank.rawValue)) {
            return true
        }
        
        return false
    }
    
    func checkContinueGame() -> Bool {
        var shouldContinue = true
        
        [Player.black, Player.white].forEach({
            if chessBoard.myPawns(color: $0).count == 0 {
                shouldContinue = false
            }
        })
        return shouldContinue
    }
    
    private func printError(_ error: Error) {
        print(error.message)
    }
    
    func score() -> Int {
        let score = chessBoard.myPawns(color: self.currentPalyer).count
        return score
    }
    
}

extension ChessGame {
    // MARK: - 초기 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
    static func startPositionOfBlackPawns() -> [Position] {
        return File.allCases.map({ Position(file: $0, rank: .two) })
    }
    
    static func startPositionOfWhitePawns() -> [Position] {
        return File.allCases.map({ Position(file: $0, rank: .seven) })
    }
}

