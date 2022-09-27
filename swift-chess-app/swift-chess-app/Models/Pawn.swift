//
//  Pawn.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct Pawn: ChessPiece {
    
    let score: Int = 1
    
    let color: ChessPieceColor
    
    var point: ChessPoint
    
    var movablePoints: [ChessPoint] {
        switch color {
        case .white: return [ChessPoint(rank: point.rank - 1, file: point.file)]
        case .black: return [ChessPoint(rank: point.rank + 1, file: point.file)]
        }
    }
    
    var toString: String { "Pawn" }
    
    var toIcon: String {
        switch color {
        case .white: return "♙"
        case .black: return "♟"
        }
    }
    
    init(color: ChessPieceColor, point: ChessPoint) {
        self.color = color
        self.point = point
    }
}
