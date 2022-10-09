//
//  RookPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct RookPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 5
    var symbol: Character {
        teamColor == .white ? "♖" : "♜"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        return delta.rank == 0 || delta.file == 0
    }
}
