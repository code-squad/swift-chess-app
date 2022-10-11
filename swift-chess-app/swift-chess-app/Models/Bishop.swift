//
//  Bishop.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

struct Bishop: Piece {
    
    let color: Color
    
    var point: Point
    
    var score: Int { 3 }
    
    var steps: [Tuple] {
        [
            Direction.ne,
            Direction.se,
            Direction.sw,
            Direction.nw
        ].map { $0.toTuple }
    }
    
    var maxStepDistance: Int { 7 }
    
    var toString: String { "Bishop" }
    
    var toIcon: String {
        switch color {
        case .white:
            return "♗"
        case .black:
            return "♝"
        }
    }
}
