//
//  Queen.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

struct Queen: Piece {
    
    let color: Color
    
    var point: Point
    
    var score: Int { 9 }
    
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
    
    var maxStepDistance: Int { 7 }
    
    var toString: String { "Queen" }
    
    var toIcon: String {
        switch color {
        case .white:
            return "♕"
        case .black:
            return "♛"
        }
    }
}
