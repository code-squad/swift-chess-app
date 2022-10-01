//
//  RookPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct RookPiece: ChessPieceProtocol {
    let teamColor: TeamColor
    static let score = 5
    var symbol: Character {
        teamColor == .white ? "♖" : "♜"
    }
    
    static func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        origin.file == destination.file || origin.rank == destination.rank
    }
}
