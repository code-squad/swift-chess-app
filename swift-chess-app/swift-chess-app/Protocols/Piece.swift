//
//  Piece.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol Piece {
    
    var score: Int { get }
    
    var color: PieceColor { get }
    
    var point: Point { get set }
    
    var movablePoints: [Point] { get }
    
    var toString: String { get }
    
    var toIcon: String { get }
    
    mutating func update(point: Point) -> Void
}

extension Piece {
    
    mutating func update(point: Point) {
        self.point = point
    }
}
