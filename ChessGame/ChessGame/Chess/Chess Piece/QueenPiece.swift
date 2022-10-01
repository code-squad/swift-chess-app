//
//  QueenPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct QueenPiece: ChessPieceProtocol {
    let teamColor: TeamColor
    static let score = 8
    var symbol: Character {
        teamColor == .white ? "♕" : "♛"
    }
    
    static func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        return BishopPiece.isMovementValid(
            origin: origin,
            destination: destination,
            board: board
        ) || RookPiece.isMovementValid(
            origin: origin,
            destination: destination,
            board: board
        )
    }
}
