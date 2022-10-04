//
//  Knight.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import Foundation

class Knight: Piece {
    let emoji: Emoji
    let team: Team
    let score: Score

    init(team: Team) {
        self.emoji = team == .white ? .whiteKnight : .blackKnight
        self.team = team
        self.score = Score(point: 3)
    }

    func canMove(from: Position, to: Position) -> Bool {
        return (abs(from.file.index - to.file.index) == 2 && abs(from.rank.index - to.rank.index) == 1)
        || (abs(from.file.index - to.file.index) == 1 && abs(from.rank.index - to.rank.index) == 2)
    }

    func movablePositions(from: Position) -> [Position] {
        var movablePositions: [Position] = []

        if let rightTopRight = from.right?.topRight {
            movablePositions.append(rightTopRight)
        }
        if let topTopRight = from.top?.topRight {
            movablePositions.append(topTopRight)
        }
        if let leftTopLeft = from.left?.topLeft {
            movablePositions.append(leftTopLeft)
        }
        if let topTopLeft = from.top?.topLeft {
            movablePositions.append(topTopLeft)
        }
        if let rightBottomRight = from.right?.bottomRight {
            movablePositions.append(rightBottomRight)
        }
        if let bottomBottomRight = from.bottom?.bottomRight {
            movablePositions.append(bottomBottomRight)
        }
        if let leftBottomLeft = from.left?.bottomLeft {
            movablePositions.append(leftBottomLeft)
        }
        if let bottomBottomLeft = from.bottom?.bottomLeft {
            movablePositions.append(bottomBottomLeft)
        }

        return movablePositions
    }
}
