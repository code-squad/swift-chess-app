//
//  ChessGame.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/25.
//

import Foundation

class ChessGame {
    private(set) var board = ChessBoard.standardChessBoard()
    private(set) var playerTurn: TeamColor = .white
    func movePiece(from origin: Position, to destination: Position) -> Bool {
        guard
            board.canAccess(position: origin),
            board[origin]?.teamColor == playerTurn
        else { return false }
        guard board.movePiece(from: origin, to: destination) else { return false }
        togglePlayerTurn()
        return true
    }
    
    private func togglePlayerTurn() {
        playerTurn = playerTurn == .white ? .black : .white
    }
}
