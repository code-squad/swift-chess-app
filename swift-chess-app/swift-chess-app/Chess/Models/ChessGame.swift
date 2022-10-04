//
//  ChessGame.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

class ChessGame {
    typealias PlayerColor = ChessPieceColor
    
    let chessBoard = ChessBoard()
    var currentPalyerColor: PlayerColor = .black
    
    func start() {
        // 생성
        createPieces()
        
        // 게임 진행
        while checkContinueGame() {
            let inputString = ""
            guard let command = Command(inputString: inputString) else {
                printError(CommandError.invalidFormat)
                continue
            }

            if command.type == .move,
               let from = command.fromPosition(),
               let to = command.toPosition() {
                guard checkValidatePosition(playerColor: currentPalyerColor, from: from, to: to)
                else {
                    printError(PieceError.invalidPosition)
                    continue
                }

                guard chessBoard.movePiece(color: currentPalyerColor, from: from, to: to)
                else {
                    printError(PieceError.notFindPiece)
                    continue
                }

                if let removeTarget = chessBoard.checkHitPiece(color: currentPalyerColor, position: to) {
                    chessBoard.killChessPiece(removeTarget)
                }

                chessBoard.display()
                changeTurnPalyer()
            } else if command.type == .info,
                      let infoPosition = command.infoPosition(){
                if chessBoard.infoDisplay(color: currentPalyerColor, position: infoPosition) == false {
                    let otherPalyerColor: PlayerColor = self.currentPalyerColor == .black ? .white : .black
                    printError(CommandError.invaildPlayer(otherPalyerColor))
                }
            }
        }
    }
    
    func changeTurnPalyer() {
        let turnPalyer: PlayerColor = currentPalyerColor == .black ? .white : .black
        self.currentPalyerColor = turnPalyer
    }
    
    func checkValidatePosition(playerColor: PlayerColor, from: Position, to: Position) -> Bool {
        let movablePosition = chessBoard.movablePositions(color: playerColor, position: from )
        return movablePosition.first(where: { $0 == to }) != nil
    }
    
    func checkContinueGame() -> Bool {
        var shouldContinue = true
        
        [PlayerColor.black, PlayerColor.white].forEach({
            if chessBoard.myPieces(color: $0).count == 0 {
                shouldContinue = false
            }
        })
        return shouldContinue
    }
    
    private func printError(_ error: ChessBoardError) {
        print(error.message)
    }
    
    func score() -> Int {
        return chessBoard
            .myPieces(color: self.currentPalyerColor)
            .map({ $0.point })
            .reduce(0, { $0 + $1 })
    }
    
}

// MARK: - Create Pieces
extension ChessGame {
    private func createPieces() {
        createPawns()
        createRooks()
        createQueens()
        createBishops()
        createKnights()
    }
    
    private func createPawns() {
        chessBoard.createPawns(color: .black, positions: Self.startPositionOfBlackPawns())
        chessBoard.createPawns(color: .white, positions: Self.startPositionOfWhitePawns())
    }
    
    private func createBishops() {
        chessBoard.createBishops(color: .black, positions: Self.startPositionOfBlackBishops())
        chessBoard.createBishops(color: .white, positions: Self.startPositionOfWhiteBishops())
    }
    
    private func createRooks() {
        chessBoard.createRooks(color: .black, positions: Self.startPositionOfBlackRooks())
        chessBoard.createRooks(color: .white, positions: Self.startPositionOfWhiteRooks())
    }
    
    private func createQueens() {
        chessBoard.createQueens(color: .black, positions: Self.startPositionOfBlackQueens())
        chessBoard.createQueens(color: .white, positions: Self.startPositionOfWhiteQueens())
    }
    
    private func createKnights() {
        chessBoard.createKnights(color: .black, positions: Self.startPositionOfBlackKnights())
        chessBoard.createKnights(color: .white, positions: Self.startPositionOfWhiteKnights())
    }
}


// MARK: - Statics
extension ChessGame {
    // MARK: - 초기 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
    static func startPositionOfBlackPawns() -> [Position] {
        return File.allCases.map({ Position(file: $0, rank: .two) })
    }
    
    static func startPositionOfWhitePawns() -> [Position] {
        return File.allCases.map({ Position(file: $0, rank: .seven) })
    }
    
    // MARK: - 생성 위치는 흑색은 C-1 과 F-1 에만 가능하고, 백색은 C-8 과 F-8 에만 가능하다.
    static func startPositionOfBlackBishops() -> [Position] {
        return [Position(file: .c, rank: .one),
                Position(file: .f, rank: .one)]
    }
    
    static func startPositionOfWhiteBishops() -> [Position] {
        return [Position(file: .c, rank: .eight),
                Position(file: .f, rank: .eight)]
    }
    
    // MARK: - 생성 위치는 흑색은 A-1 과 H-1 에만 가능하고, 백색은 A-8 과 H-8 에만 가능하다.
    static func startPositionOfBlackRooks() -> [Position] {
        return [Position(file: .a, rank: .one),
                Position(file: .h, rank: .one)]
    }
    
    static func startPositionOfWhiteRooks() -> [Position] {
        return [Position(file: .a, rank: .eight),
                Position(file: .h, rank: .eight)]
    }
    
    // MARK: - 생성 위치는 흑색은 E-1에만 가능하고, 백색은 E-8 에만 가능하다.
    static func startPositionOfBlackQueens() -> [Position] {
        return [Position(file: .e, rank: .one)]
    }
    
    static func startPositionOfWhiteQueens() -> [Position] {
        return [Position(file: .e, rank: .eight)]
    }
    
    // MARK: - 생성 위치는 흑색은 B-1 과 G-1 에만 가능하고, 백색은 B-8 과 G-8 에만 가능하다.
    static func startPositionOfBlackKnights() -> [Position] {
        return [Position(file: .b, rank: .one),
                Position(file: .g, rank: .one)]
    }
    
    static func startPositionOfWhiteKnights() -> [Position] {
        return [Position(file: .b, rank: .eight),
                Position(file: .g, rank: .eight)]
    }
}

