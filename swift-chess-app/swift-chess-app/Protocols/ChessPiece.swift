//
//  ChessPiece.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol ChessPiece {
    
    var score: Int { get }
    
    var color: ChessPieceColor { get }
    
    var point: ChessPoint { get set }
    
    var movablePoints: [ChessPoint] { get }
    
    var toString: String { get }
    
    var toIcon: String { get }
    
    mutating func update(point: ChessPoint) -> Void
}

extension ChessPiece {
    
    mutating func update(point: ChessPoint) {
        self.point = point
    }
}
