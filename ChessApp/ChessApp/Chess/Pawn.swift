//
//  Pawn.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

final class Pawn {
    let color: PawnColor
    
    init(color: PawnColor) {
        self.color = color
    }
    
    func checkEnableToMove(from: Position, to: Position) -> Bool {
        switch color {
        case .black:
            return from.rank.rawValue < to.rank.rawValue
        case .white:
            return from.rank.rawValue > to.rank.rawValue
        }
    }
}

extension Pawn {
    enum PawnColor {
        case black
        case white
        
        var turn: String {
            switch self {
            case .black: return "흑색 체스말의 차례입니다."
            case .white: return "백색 체스말의 차례입니다."
            }
        }
        
        var display: String {
            switch self {
            case .black: return "♟"
            case .white: return "♙"
            }
        }
    }
}

extension Pawn: Equatable {
    static func == (lhs: Pawn, rhs: Pawn) -> Bool {
        lhs.color == rhs.color
    }
}
