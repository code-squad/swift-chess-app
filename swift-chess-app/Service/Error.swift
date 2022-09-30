//
//  Error.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/30.
//

import Foundation

/// 현재는 에러의 경우의수가 많지 않아서, ChessError로 정의 해 두었습니다.
/// 분리가 필요해질 때, 분리하겠습니다.
enum ChessError: Error {
    case UnknownFaction(playerFaction: PlayerFaction)
    case UnitCountNotMatch(playerFaction: PlayerFaction, unit: ChessUnitType, definedCount: Int, makeCount: Int)
}
