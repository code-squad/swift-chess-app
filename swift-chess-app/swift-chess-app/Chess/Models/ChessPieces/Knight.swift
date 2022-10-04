//
//  Knight.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

struct Knight: Equatable, ChessPiecable, ChessPieceMovableChecker {
    private(set) var color: ChessPieceColor
    var position: Position
    
    var point: Int {
        return Dimension.Point.knight
    }

    // MARK: 나이트는 점프로만 이동이 가능 (1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2)
    var movableDirection: [ChessDirection] {
        return [.jumpToOneClock, .jumpToTwoClock,
                .jumpToFourClock, .jumpToFiveClock,
                .jumpToSevenClock, .jumpToEightClock,
                .jumpToTenClock, .jumpToElevenClock]
    }
    
    var description: String {
        return color == .black ? "♞" : "♘"
    }
    
    func movablePositions() -> [Position] {
        return movablePositions(self.position, limitDepth: 1)
    }
}
