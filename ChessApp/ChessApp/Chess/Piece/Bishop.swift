//
//  Bishop.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/10/03.
//

import Foundation

struct Bishop: Piece {
    var color: PieceColor
    var score: Int {
        return 3
    }
    var display: String {
        return color == .black ? "♝" : "♗"
    }
    
    func startPosition() -> [Position] {
        switch color {
        case .black:
            return [Position(file: .C, rank: .one),
                    Position(file: .F, rank: .one)]
        case .white:
            return [Position(file: .C, rank: .eight),
                    Position(file: .F, rank: .eight)]
        }
    }
    
    func validToMovePosition(current: Position, to: Position) -> Bool {
        return true
    }
}
