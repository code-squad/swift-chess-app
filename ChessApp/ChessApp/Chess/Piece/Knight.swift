//
//  Knight.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/10/05.
//

import Foundation

struct Knight: Piece {
    var color: PieceColor
    var score: Int {
        return 3
    }
    var display: String {
        return color == .black ? "♞" : "♘"
    }
    
    func startPosition() -> [Position] {
        switch color {
        case .black:
            return [Position(file: .B, rank: .one),
                    Position(file: .G, rank: .one)]
        case .white:
            return [Position(file: .B, rank: .eight),
                    Position(file: .G, rank: .eight)]
        }
    }
    
    func validToMovePosition(current: Position, to: Position) -> Bool {
        return true
    }
}
