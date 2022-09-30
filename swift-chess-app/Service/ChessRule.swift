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
    /// 이쪽도 피드백 반영하면서 고민을 조금 했습니다.
    /// Pawn같은경우에는 문제가 없지만, 다른 유닛의 경우 한줄로 채워지지 않기 때문에 정확한 위치를 고지해야 합니다.
    /// 따라서 추후 유닛이 추가될 때 새로운 설계가 필요 해 보이네요.
    // TODO: 추후 재설계 필요
    static let pawnPosition: [PlayerFaction: Int] = [.Black: 1, .White: 6]
}

struct ChessRule {
    static let boardSize = 8
}
