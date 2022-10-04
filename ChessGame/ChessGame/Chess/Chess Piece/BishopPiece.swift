//
//  BishopPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct BishopPiece: ChessPieceProtocol {
    let teamColor: TeamColor
    static let score = 3
    var symbol: Character {
        teamColor == .white ? "♗" : "♝"
    }
    
    static func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        let delta = destination - origin
        return abs(delta.file) == abs(delta.rank)
    }
}
