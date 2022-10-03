//
//  Queen.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

final class Queen: Piece {
    
    override var score: Int { 9 }
    
    override var steps: [Tuple] {
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
    
    override var maxStepDistance: Int { 7 }
    
    override var toString: String { "Queen" }
    
    override var toIcon: String {
        switch color {
        case .white:
            return "♕"
        case .black:
            return "♛"
        }
    }
}
