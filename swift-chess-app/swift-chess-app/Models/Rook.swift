//
//  Rook.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

struct Rook: Piece {
    
    let color: Color
    
    var point: Point
    
    var score: Int { 5 }
    
    var steps: [Tuple] {
        [
            Direction.n,
            Direction.e,
            Direction.s,
            Direction.w
        ].map { $0.toTuple }
    }
    
    var maxStepDistance: Int { 7 }
    
    var toString: String { "Rook" }
    
    var toIcon: String {
        switch color {
        case .white:
            return "♖"
        case .black:
            return "♜"
        }
    }
}
