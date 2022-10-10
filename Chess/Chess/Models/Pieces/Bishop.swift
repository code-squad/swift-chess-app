//
//  Bishop.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import Foundation

class Bishop: Piece {
    let emoji: Emoji
    let team: Team
    let score: Score

    init(team: Team) {
        self.emoji = team == .white ? .whiteBishop : .blackBishop
        self.team = team
        self.score = Score(point: 3)
    }

    func canMove(from: Position, to: Position) -> Bool {
        return from.file.index - to.file.index == from.rank.index - to.rank.index
    }

    func movablePositions(from: Position) -> [Position] {
        var movablePositions: [Position] = []

        var topRight = from.topRight
        while let unwrappedTopRight = topRight {
            movablePositions.append(unwrappedTopRight)
            topRight = unwrappedTopRight.topRight
        }
        var topLeft = from.topLeft
        while let unwrappedTopLeft = topLeft {
            movablePositions.append(unwrappedTopLeft)
            topLeft = unwrappedTopLeft.topLeft
        }
        var bottomRight = from.bottomRight
        while let unwrappedbottomRight = bottomRight {
            movablePositions.append(unwrappedbottomRight)
            bottomRight = unwrappedbottomRight.bottomRight
        }
        var bottomLeft = from.bottomLeft
        while let unwrappedbottomLeft = bottomLeft {
            movablePositions.append(unwrappedbottomLeft)
            bottomLeft = unwrappedbottomLeft.bottomLeft
        }

        return movablePositions
    }
}
