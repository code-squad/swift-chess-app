//
//  ChessGame.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/25.
//

import Foundation

class ChessGame: ObservableObject {
    @Published private(set) var board = ChessBoard.standardChessBoard()
    private(set) var playerTurn: TeamColor = .white
    
    @discardableResult
    func movePiece(from origin: Position, to destination: Position) -> Bool {
        guard
            board.canAccess(position: origin),
            board[origin]?.teamColor == playerTurn,
            board.movePiece(from: origin, to: destination)
        else { return false }
        
        togglePlayerTurn()
        return true
    }
    
    func availableMovingPositions(at position: Position) -> Set<Position> {
        guard
            board.canAccess(position: position),
            board[position]?.teamColor == playerTurn
        else { return [] }
        return board.availableMovingPositions(at: position)
    }
    
    private func togglePlayerTurn() {
        playerTurn = playerTurn == .white ? .black : .white
    }
}
