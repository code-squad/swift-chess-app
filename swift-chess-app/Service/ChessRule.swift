//
//  ChessRule.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

enum PlayerFaction: String, CaseIterable {
    case Black = "흑"
    case White = "백"
}

struct UnitRule {
    static let pawnCount = 8
    static let pawnPosition: [PlayerFaction: Int] = [.Black: 1, .White: 6]
}

struct ChessRule {
    static let boardSize = 8
}
