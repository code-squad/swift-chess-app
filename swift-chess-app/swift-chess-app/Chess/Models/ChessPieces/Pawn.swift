//
//  Pawn.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

struct Pawn: Equatable, ChessPiecable, ChessPieceMovableChecker {
    private(set) var color: ChessPieceColor
    var position: Position
    
    var point: Int {
        return Dimension.Point.pawn
    }
    
    // MARK: 백색은 더 작은 rank로 움직일 수 있고, 흑색은 더 큰 rank로 움직일 수 있다.
    var movableDirection: [ChessDirection] {
        return color == .black ? [.go] : [.back]
    }
    
    var description: String {
        return color == .black ? "♟" : "♙"
    }
    
    func movablePositions() -> [Position] {
        guard let movablePosition = self.movablePositions(self.position, limitDepth: 1).first else { return [] }
        return [movablePosition]
    }
}

