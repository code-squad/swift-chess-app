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
    case Knight = "Night"
    case Bishop = "Bishop"
    case Rook = "Rook"
    case Queen = "Queen"
    case King = "King"
}

extension ChessUnitType {
    func icon(_ playerFaction: PlayerFaction) -> String {
        switch self {
        case .None: return "."
        case .Pawn: return playerFaction == .Black ? "♟" : "♙"
        case .Knight: return playerFaction == .Black ? "♞" : "♘"
        case .Bishop: return playerFaction == .Black ? "♝" : "♗"
        case .Rook: return playerFaction == .Black ? "♜" : "♖"
        case .Queen: return playerFaction == .Black ? "♛" : "♕"
        case .King: return playerFaction == .Black ? "♚" : "♔"
        }
    }
    
    var score: Int {
        switch self {
        case .None: return UnitRule.Point.none
        case .Pawn: return UnitRule.Point.pawn
        case .Knight: return UnitRule.Point.knight
        case .Bishop: return UnitRule.Point.bishop
        case .Rook: return UnitRule.Point.rook
        case .Queen: return UnitRule.Point.queen
        case .King: return UnitRule.Point.none
        }
    }
}
