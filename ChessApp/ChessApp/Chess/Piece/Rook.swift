//
//  Rook.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/10/03.
//

import Foundation

struct Rook: Piece {
    var color: PieceColor
    var score: Int {
        return 5
    }
    var display: String {
        return color == .black ? "♜" : "♖"
    }
    
    func startPosition() -> [Position] {
        switch color {
        case .black:
            return [Position(file: .A, rank: .one),
                    Position(file: .H, rank: .one)]
        case .white:
            return [Position(file: .A, rank: .eight),
                    Position(file: .H, rank: .eight)]
        }
    }
    
    func validToMovePosition(current: Position, to: Position) -> Bool {
        true
    }
}
