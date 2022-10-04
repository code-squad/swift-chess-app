//
//  Queen.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

struct Queen: Equatable, ChessPiecable, ChessPieceMovableChecker {
    private(set) var color: ChessPieceColor
    var position: Position
    
    var point: Int {
        return Dimension.Point.queen
    }
    
    // MARK: 퀸은 대각선 및 직선으로만 이동이 가능 (-1, -1) / (-1, +1) / (+1. -1) / (+1, +1) / (0, 1) / (0, -1) / (1. 0) / (-1, 0)
    var movableDirection: [ChessDirection] {
        return [.go, .back, .left, .right,
                .leftGo, .leftBack, .rightGo, .rightBack]
    }
    
    var description: String {
        return color == .black ? "♛" : "♕"
    }
}
