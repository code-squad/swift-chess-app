//
//  KnightPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct KnightPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 3
    var symbol: Character {
        teamColor == .white ? "♘" : "♞"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        let expectedDeltas = [
            Delta(file: 2, rank: 1),
            Delta(file: 2, rank: -1),
            Delta(file: -2, rank: 1),
            Delta(file: -2, rank: -1),
            Delta(file: 1, rank: 2),
            Delta(file: 1, rank: -2),
            Delta(file: -1, rank: 2),
            Delta(file: -1, rank: -2)
        ]
        return expectedDeltas.contains(delta)
    }
    
    func steppingPositions(origin: Position, destination: Position) -> [Position] {
        let delta = destination - origin
        let steppingPosition: Position
        
        if abs(delta.file) > abs(delta.rank) {
            let fileIsPositive = delta.file > 0
            steppingPosition = origin + Delta(file: fileIsPositive ? 1 : -1, rank: 0)
        } else {
            let rankIsPositive = delta.rank > 0
            steppingPosition = origin + Delta(file: 0, rank: rankIsPositive ? 1 : -1)
        }
        return [steppingPosition]
    }
}
