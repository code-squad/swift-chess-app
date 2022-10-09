//
//  BishopPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct BishopPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 3
    var symbol: Character {
        teamColor == .white ? "♗" : "♝"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        return abs(delta.file) == abs(delta.rank)
    }
}
