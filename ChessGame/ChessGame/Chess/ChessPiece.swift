//
//  ChessPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

enum PieceType {
    case pawn
    
    var score: Int {
        switch self {
        case .pawn: return 1
        }
    }
}

enum TeamColor {
    case white
    case black
}

struct ChessPiece {
    var type: PieceType
    let teamColor: TeamColor
    
    func availableMovements(at position: Position) -> [Position] {
        switch type {
        case .pawn:
            return pawnMovements(at: position)
        }
    }
    
    private func pawnMovements(at position: Position) -> [Position] {
        var newPosition = position
        newPosition.rank += teamColor == .white ? 1 : -1
        return [newPosition]
    }
}
