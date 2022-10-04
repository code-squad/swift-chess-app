//
//  Pawn.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

struct Pawn: Piece {
    let color: PieceColor
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
    
    func validToMovePosition(current: Position, to: Position) -> Bool {
        switch color {
        case .black:
            return current.rank.rawValue < to.rank.rawValue
            && abs(current.rank.rawValue - to.rank.rawValue) == 1
            && current.file == to.file
        case .white:
            return current.rank.rawValue > to.rank.rawValue
            && abs(current.rank.rawValue - to.rank.rawValue) == 1
            && current.file == to.file
        }
    }
}
