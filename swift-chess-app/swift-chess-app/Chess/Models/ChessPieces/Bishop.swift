//
//  Bishop.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

struct Bishop: Equatable, ChessPiecable, ChessPieceMovableChecker {
    enum Point {
        static let bishop = 3
    }
    private(set) var color: ChessPieceColor
    var position: Position
    
    var point: Int {
        return Point.bishop
    }

    // MARK: 비숍은 대각선으로만 이동이 가능 (-1, -1) / (-1, +1) / (+1. -1) / (+1, +1)
    var movableDirection: [ChessDirection] {
        return [.leftGo, .leftBack, .rightGo, .rightBack]
    }
    
    var description: String {
        return color == .black ? "♝" : "♗"
    }
}
