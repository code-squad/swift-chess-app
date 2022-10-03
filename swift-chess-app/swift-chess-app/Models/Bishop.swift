//
//  Bishop.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

final class Bishop: Piece {
    
    override var score: Int { 3 }
    
    override var movablePoints: [Point] {
        return [
            (0..<7).map { _ in Direction.ne },
            (0..<7).map { _ in Direction.se },
            (0..<7).map { _ in Direction.sw },
            (0..<7).map { _ in Direction.nw }
        ]
        .flatMap { $0 }
        .compactMap { point + $0 }
    }
    
    override var toString: String { "Bishop" }
    
    override var toIcon: String {
        switch color {
        case .white:
            return "♗"
        case .black:
            return "♝"
        }
    }
}
