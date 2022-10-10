//
//  KingPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/10.
//

import Foundation

struct KingPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 0
    var symbol: Character {
        teamColor == .white ? "♔" : "♚"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        return abs(delta.file) <= 1 &&
        abs(delta.rank) <= 1 &&
        QueenPiece(teamColor: teamColor).isDeltaValid(delta: delta)
    }
}
