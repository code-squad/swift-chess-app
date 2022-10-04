//
//  Rook.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/05.
//

import Foundation

class Rook: Piece {
    let emoji: Emoji
    let team: Team
    let score: Score

    init(team: Team) {
        self.emoji = team == .white ? .whiteRook : .blackRook
        self.team = team
        self.score = Score(point: 5)
    }

    func canMove(from: Position, to: Position) -> Bool {
        return from.rank == to.rank || from.file == to.file
    }

    func movablePositions(from: Position) -> [Position] {
        var movablePositions: [Position] = []

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
