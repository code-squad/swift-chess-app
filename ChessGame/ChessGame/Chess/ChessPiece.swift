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

struct ChessPiece: Equatable {
    var type: PieceType
    let teamColor: TeamColor
    var movementValidator: PieceMovementValidating {
        switch type {
        case .pawn:
            return PawnMovementValidator()
        }
    }
}
