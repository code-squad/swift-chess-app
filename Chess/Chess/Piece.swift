//
//  Piece.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/02.
//

import Foundation

protocol Piece {
    var emoji: Emoji { get }
    var team: Team { get }
    var score: Score { get }

    func canMove(from: Position, to: Position) -> Bool
    func movablePositions(from: Position) -> [Position]
}
