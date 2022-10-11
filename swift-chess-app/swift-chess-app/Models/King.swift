//
//  King.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/11.
//

import Foundation

struct King: Piece {
    
    let color: Color
    
    var point: Point
    
    var score: Int { 0 }
    
    var steps: [Tuple] {
        [
            Direction.n,
            Direction.e,
            Direction.s,
            Direction.w,
            Direction.ne,
            Direction.se,
            Direction.sw,
            Direction.nw
        ].map { $0.toTuple }
    }
    
    var maxStepDistance: Int { 1 }
    
    var toString: String { "King" }
    
    var toIcon: String {
        switch color {
        case .white:
            return "♔"
        case .black:
            return "♚"
        }
    }
}
