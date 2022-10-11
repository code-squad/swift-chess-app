//
//  Pawn.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct Pawn: Piece {
    
    let color: Color
    
    var point: Point
    
    var maxStepDistance: Int { 1 }
    
    var score: Int { 1 }
    
    var steps: [Tuple] {
        switch color {
        case .white:
            return [Direction.n].map { $0.toTuple }
        case .black:
            return [Direction.s].map { $0.toTuple }
        }
    }
    
    var toString: String { "Pawn" }
    
    var toIcon: String {
        switch color {
        case .white:
            return "♙"
        case .black:
            return "♟"
        }
    }
}
