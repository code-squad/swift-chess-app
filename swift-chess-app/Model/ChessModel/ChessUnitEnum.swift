//
//  ChessUnitEnum.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

enum ChessUnitType: String {
    case None = "."
    case Pawn = "Pawn"
}

extension ChessUnitType {
    func icon(_ playerFaction: PlayerFaction) -> String {
        switch self {
        case .None: return "."
        case .Pawn: return playerFaction == .Black ? "♟" : "♙"
        }
    }
}

enum ChessUnitMoveType {
    case Straight
    case Diagonal
    case Knight
}
