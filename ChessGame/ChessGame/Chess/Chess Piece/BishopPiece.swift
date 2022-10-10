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
    
    func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        
        let fileStride = stride(from: origin.file, through: destination.file)
        let rankStride = stride(from: origin.rank, through: destination.rank)
        
        var steppingPositions = zip(fileStride, rankStride)
            .map { Position(file: $0, rank: $1) }
        steppingPositions.removeFirst()
        
        for steppingPosition in steppingPositions {
            
            if let piece = board[steppingPosition] {
                
                if piece.teamColor != teamColor,
                   destination == steppingPosition {
                    return true
                }
                return false
            }
        }
        
        return true
    }
}

func stride(from start: Int, through end: Int) -> StrideThrough<Int> {
    let addingNumber = start < end ? 1 : -1
    return stride(from: start, through: end, by: addingNumber)
}
