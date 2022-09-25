//
//  ChessGame.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

class ChessGame {
    typealias Player = Pawn.Color
    
    enum Dimesion {
        static let pawnNumberOfStart = 8
    }
    
    let chessBoard = ChessBoard()
    private var currentPalyer: Player = .black
    
    private func changeTurnPalyer() {
        let turnPalyer: Player = currentPalyer == .black ? .white : .black
        self.currentPalyer = turnPalyer
    }
    
    func start() {
        chessBoard.createPawns(color: .black, positions: Self.startPositionOfBlackPawns())
        chessBoard.createPawns(color: .white, positions: Self.startPositionOfWhitePawns())
        
        while checkContinueGame() {
            guard let inputString = readLine(),
                  let command = Command.make(inputString: inputString) else { return printError() }
            let from = command.fromPosition()
            let to = command.toPosition()
            
            if checkValidatePosition(from: from, to: to) {
                chessBoard.movePawn(color: currentPalyer, from: from, to: to)
                chessBoard.display()
                changeTurnPalyer()
            } else {
                printError()
            }
        }
    }
    
    // MARK: - 폰은 직선 1칸만 이동 가능 (file +- 1) || (rank +- 1)
    private func checkValidatePosition(from: Position, to: Position) -> Bool {
        if from.file.rawValue == to.file.rawValue
            && abs(from.rank.rawValue - to.rank.rawValue) == 1 {
            return true
        } else if abs(from.file.rawValue - to.file.rawValue) == 1
                    && from.rank.rawValue == to.rank.rawValue {
            return true
        }
        
        return false
    }
    
    private func checkContinueGame() -> Bool {
        var shouldContinue = true
        
        [Player.black, Player.white].forEach({
            if chessBoard.myPawns(color: $0).count == 0 {
                shouldContinue = false
            }
        })
        return shouldContinue
    }
    
    
    // TODO: 상황에따라 나뉘어지는 에러가 많으면 에러 타입 따로 정의하기
    private func printError() {
        print("error message")
    }
    
    func score() -> Int {
        let score = chessBoard.myPawns(color: self.currentPalyer).count
        return score
    }
    
}

extension ChessGame {
    // MARK: - 초기 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
    static func startPositionOfBlackPawns() -> [Position] {
        return Rank.allCases.map({ Position(file: .two, rank: $0) })
    }
    
    static func startPositionOfWhitePawns() -> [Position] {
        return Rank.allCases.map({ Position(file: .seven, rank: $0) })
    }
}

