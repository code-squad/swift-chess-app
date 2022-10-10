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
    
    func steppingPositions(origin: Position, destination: Position) -> [Position] {
        let fileStride = stride(from: origin.file, through: destination.file)
        let rankStride = stride(from: origin.rank, through: destination.rank)
        
        var steppingPositions = zip(fileStride, rankStride)
            .map { Position(file: $0, rank: $1) }
        steppingPositions.removeFirst()
        return steppingPositions
    }
}
