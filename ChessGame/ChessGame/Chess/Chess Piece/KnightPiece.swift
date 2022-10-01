//
//  KnightPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct KightPiece: ChessPieceProtocol {
    let teamColor: TeamColor
    static let score = 3
    var symbol: Character {
        teamColor == .white ? "♘" : "♞"
    }
    
    static func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        let availableDeltas = [
            (1, 2),
            (2, 1),
            (2, -1),
            (-2, 1),
            (-1, -2),
            (-2, -1),
            (1, -2),
            (-1, 2)
        ]
        let delta = (
            destination.file - origin.file,
            destination.rank - origin.rank
        )
        return availableDeltas.contains { $0 == delta }
    }
}
