//
//  Pawn.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

final class Pawn: Piece {
    
    override var score: Int { 1 }
    
    override var movablePoints: [Point] {
        let results: [Point?]
        switch color {
        case .white:
            results = [point + Direction.n]
        case .black:
            results = [point + Direction.s]
        }
        return results.compactMap { $0 }
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
