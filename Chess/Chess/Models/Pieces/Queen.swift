//
//  Queen.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import Foundation

class Queen: Piece {
    let emoji: Emoji
    let team: Team
    let score: Score

    init(team: Team) {
        self.emoji = team == .white ? .whiteQueen : .blackQueen
        self.team = team
        self.score = Score(point: 9)
    }

    func canMove(from: Position, to: Position) -> Bool {
        return abs(from.file.index - to.file.index) == abs(from.rank.index - to.rank.index)
        || from.rank == to.rank
        || from.file == to.file
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
        var left = from.left
        while let unwrappedLeft = left {
            movablePositions.append(unwrappedLeft)
            left = unwrappedLeft.left
        }
        var right = from.right
        while let unwrappedRight = right {
            movablePositions.append(unwrappedRight)
            right = unwrappedRight.right
        }
        var top = from.top
        while let unwrappedTop = top {
            movablePositions.append(unwrappedTop)
            top = unwrappedTop.top
        }
        var bottom = from.bottom
        while let unwrappedBottom = bottom {
            movablePositions.append(unwrappedBottom)
            bottom = unwrappedBottom.bottom
        }

        return movablePositions
    }
}
