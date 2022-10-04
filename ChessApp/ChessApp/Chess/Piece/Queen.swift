//
//  Queen.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/10/05.
//

import Foundation

struct Queen: Piece {
    var color: PieceColor
    var score: Int {
        return 9
    }
    var display: String {
        return color == .black ? "♛" : "♕"
    }
    
    func startPosition() -> [Position] {
        switch color {
        case .black:
            return [Position(file: .E, rank: .one)]
        case .white:
            return [Position(file: .E, rank: .eight)]
        }
    }
    
    func validToMovePosition(current: Position, to: Position) -> Bool {
        return true
    }
}
