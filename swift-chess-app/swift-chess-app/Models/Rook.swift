//
//  Rook.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

final class Rook: Piece {
    
    override var score: Int { 5 }
    
    override var movablePoints: [Point] {
        return [
            (0..<7).map { _ in Direction.n },
            (0..<7).map { _ in Direction.e },
            (0..<7).map { _ in Direction.s },
            (0..<7).map { _ in Direction.w }
        ]
        .flatMap { $0 }
        .compactMap { point + $0 }
    }
    
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
