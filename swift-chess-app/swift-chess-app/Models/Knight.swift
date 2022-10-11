//
//  Knight.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

struct Knight: Piece {
    
    let color: Color
    
    var point: Point
    
    var score: Int { 3 }
    
    var steps: [Tuple] {
        [
            Direction.n + Direction.nw,
            Direction.n + Direction.ne,
            Direction.e + Direction.ne,
            Direction.e + Direction.se,
            Direction.s + Direction.se,
            Direction.s + Direction.sw,
            Direction.w + Direction.nw,
            Direction.w + Direction.sw,
        ]
    }
    
    var maxStepDistance: Int { 1 }
    
    var toString: String { "Knight" }
    
    var toIcon: String {
        switch color {
        case .white:
            return "♘"
        case .black:
            return "♞"
        }
    }
}
