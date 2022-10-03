//
//  Rook.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

final class Rook: Piece {
    
    override var score: Int { 5 }
    
    override var steps: [Tuple] {
        [
            Direction.n,
            Direction.e,
            Direction.s,
            Direction.w
        ].map { $0.toTuple }
    }
    
    override var maxStepDistance: Int { 7 }
    
    override var toString: String { "Rook" }
    
    override var toIcon: String {
        switch color {
        case .white:
            return "♖"
        case .black:
            return "♜"
        }
    }
}
