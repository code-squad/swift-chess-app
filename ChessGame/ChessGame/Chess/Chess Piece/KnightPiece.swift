//
//  KnightPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

typealias Delta = Position

struct KightPiece: ChessPieceProtocol {
    let teamColor: TeamColor
    static let score = 3
    var symbol: Character {
        teamColor == .white ? "♘" : "♞"
    }
    
    static func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        
        let delta = origin - destination
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

extension Delta {
    static func -(lhs: Position, rhs: Position) -> Delta {
        var lhs = lhs
        lhs.file -= rhs.file
        lhs.rank -= rhs.rank
        return lhs
    }
}

extension Position {
    static func +(lhs: Position, rhs: Delta) -> Position {
        var lhs = lhs
        lhs.file += rhs.file
        lhs.rank += rhs.rank
        return lhs
    }
}
