//
//  Pawn.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/09/25.
//

import Foundation

class Pawn: Piece {
    let emoji: Emoji
    let team: Team
    let score: Score

    init(team: Team) {
        self.emoji = team == .white ? .whitePawn : .blackPawn
        self.team = team
        self.score = Score(point: 1)
    }

    func canMove(from: Position, to: Position) -> Bool {
        return canMoveHorizontally(from: from, to: to)
        || canMoveVertically(from: from, to: to)
    }

    private func canMoveHorizontally(from: Position, to: Position) -> Bool {
        return from.right == to || from.left == to
    }

    private func canMoveVertically(from: Position, to: Position) -> Bool {
        return team == .white
        ? from.top == to
        : from.bottom == to
    }

    func movablePositions(from: Position) -> [Position] {
        var movablePositions: [Position] = []

        if let left = from.left {
            movablePositions.append(left)
        }
        if let right = from.right {
            movablePositions.append(right)
        }
        if team == .white,
           let top = from.top {
            movablePositions.append(top)
        }
        if team == .black,
           let bottom = from.bottom {
            movablePositions.append(bottom)
        }

        return movablePositions
    }
}
