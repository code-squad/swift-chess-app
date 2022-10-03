//
//  Pawn.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

final class Pawn: Piece {
    
    override var score: Int { 1 }
    
    override var steps: [Tuple] {
        switch color {
        case .white:
            return [Direction.n].map { $0.toTuple }
            
        case .black:
            return [Direction.s].map { $0.toTuple }
        }
    }
    
    override var toString: String { "Pawn" }
    
    override var toIcon: String {
        switch color {
        case .white:
            return "♙"
        case .black:
            return "♟"
        }
    }
}
