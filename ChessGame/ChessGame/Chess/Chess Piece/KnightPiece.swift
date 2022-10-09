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
    
    func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        
        let delta = destination - origin
        let availableDeltas: [Delta]
        let steppingPosition: Position
        
        // 지나가는 위치에 다른 기물이 막고 있지 않은지 확인한다.
        if abs(delta.file) > abs(delta.rank) {
            let fileIsPositive = delta.file > 0
            steppingPosition = origin + Delta(file: fileIsPositive ? 1 : -1, rank: 0)
            
            availableDeltas = fileIsPositive ? [
                Delta(file: 2, rank: 1),
                Delta(file: 2, rank: -1)
            ] : [
                Delta(file: -2, rank: 1),
                Delta(file: -2, rank: -1)
            ]
        } else {
            let rankIsPositive = delta.rank > 0
            steppingPosition = origin + Delta(file: 0, rank: rankIsPositive ? 1 : -1)
            
            availableDeltas = rankIsPositive ? [
                Delta(file: 1, rank: 2),
                Delta(file: -1, rank: 2)
            ] : [
                Delta(file: 1, rank: -2),
                Delta(file: -1, rank: -2)
            ]
        }
        
        guard board[steppingPosition] == nil else { return false }
        
        return availableDeltas.contains(delta)
    }
}
