//
//  Rook.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

struct Rook: Equatable, ChessPiecable, ChessPieceMovableChecker {
    private(set) var color: ChessPieceColor
    var position: Position
    
    var point: Int {
        return Dimension.Point.rook
    }
    
    // MARK: 룩은 직선으로만 이동이 가능 (0, 1) / (0, -1) / (1. 0) / (-1, 0)
    var movableDirection: [ChessMovableDirection] {
        return [.go, .back, .left, .right]
    }
    
    var description: String {
        return color == .black ? "♜" : "♖"
    }
}
