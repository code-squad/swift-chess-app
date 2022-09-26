//
//  Pawn.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/09/25.
//

import Foundation

protocol Piece {
    var emoji: String { get }
    var team: Team { get }

    func canMove(from: Position, to: Position) -> Bool
    func movablePositions(from: Position) -> [Position]
}

class Pawn: Piece {
    let emoji: String
    let team: Team

    init(team: Team) {
        self.emoji = team == .white ? "♙" : "♟"
        self.team = team
    }

    func canMove(from: Position, to: Position) -> Bool {
        return canMoveHorizontally(from: from, to: to)
        || canMoveVertically(from: from, to: to)
    }

    private func canMoveHorizontally(from: Position, to: Position) -> Bool {
        if from.rankIndex == to.rankIndex,
           abs(from.fileIndex - to.fileIndex) == 1 {
            return true
        }

        return false
    }

    private func canMoveVertically(from: Position, to: Position) -> Bool {
        if from.fileIndex == to.fileIndex {
            return team == .white
            ? from.rankIndex - 1 == to.rankIndex
            : from.rankIndex + 1 == to.rankIndex
        }

        return false
    }

    func movablePositions(from: Position) -> [Position] {
        var movablePositions: [Position] = []

        if 0..<8 ~= from.fileIndex - 1 {
            movablePositions.append(
                Position(
                    fileIndex: from.fileIndex - 1,
                    rankIndex: from.rankIndex
                )
            )
        }
        if 0..<8 ~= from.fileIndex + 1 {
            movablePositions.append(
                Position(
                    fileIndex: from.fileIndex + 1,
                    rankIndex: from.rankIndex
                )
            )
        }
        if team == .white && 0..<8 ~= from.rankIndex - 1 {
            movablePositions.append(
                Position(
                    fileIndex: from.fileIndex,
                    rankIndex: from.rankIndex - 1
                )
            )
        } else if team == .black && 0..<8 ~= from.rankIndex + 1 {
            movablePositions.append(
                Position(
                    fileIndex: from.fileIndex,
                    rankIndex: from.rankIndex + 1
                )
            )
        }

        return movablePositions
    }
}
