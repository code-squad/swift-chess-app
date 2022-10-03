//
//  Knight.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

final class Knight: Piece {
    
    override var score: Int { 3 }
    
    override var movablePoints: [Point] {
        return [
            Direction.n + Direction.nw,
            Direction.n + Direction.ne,
            Direction.e + Direction.ne,
            Direction.e + Direction.se,
            Direction.s + Direction.se,
            Direction.s + Direction.sw,
            Direction.w + Direction.nw,
            Direction.w + Direction.sw,
        ].compactMap { point + $0 }
    }
    
    override var toString: String { "Knight" }
    
    override var toIcon: String {
        switch color {
        case .white:
            return "♘"
        case .black:
            return "♞"
        }
    }
}
