//
//  Pawn.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

struct Pawn: Piece {
    let color: PieceColor
    var maxCount: Int {
        return 8
    }
    var score: Int {
        return 1
    }
    var display: String {
        return color == .black ? "♟" : "♙"
    }
    
    func startPosition() -> [Position] {
        switch color {
        case .black:
            return Position.File.allCases.compactMap { Position(file: $0, rank: .two) }
        case .white:
            return Position.File.allCases.compactMap { Position(file: $0, rank: .seven) }
        }
    }
    
//    func checkEnableToMove(from: Position, to: Position) -> Bool {
//        switch color {
//        case .black:
//            return from.rank.rawValue < to.rank.rawValue
//        case .white:
//            return from.rank.rawValue > to.rank.rawValue
//        }
//    }
}
