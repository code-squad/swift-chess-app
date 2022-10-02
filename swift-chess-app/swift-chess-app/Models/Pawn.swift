//
//  Pawn.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct Pawn: Piece {
    
    let score: Int = 1
    
    let color: PieceColor
    
    var point: Point
    
    var movablePoints: [Point] {
        switch color {
        case .white: return [Point(rank: point.rank - 1, file: point.file)]
        case .black: return [Point(rank: point.rank + 1, file: point.file)]
        }
    }
    
    var toString: String { "Pawn" }
    
    var toIcon: String {
        switch color {
        case .white: return "♙"
        case .black: return "♟"
        }
    }
    
    init(color: PieceColor, point: Point) {
        self.color = color
        self.point = point
    }
}
