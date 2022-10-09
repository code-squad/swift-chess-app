//
//  PawnPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct PawnPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 1
    var symbol: Character {
        teamColor == .white ? "♙" : "♟"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        let expectedRankDelta = teamColor == .white ? 1 : -1
        return delta.rank == expectedRankDelta
    }
}
