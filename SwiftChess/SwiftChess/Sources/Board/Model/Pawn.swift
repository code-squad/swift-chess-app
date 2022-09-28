//
//  Pawn.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

struct Pawn: Piece {
    static let maxCount: Int = 8

    let color: PieceColor

    var initialRank: Int {
        switch color {
        case .black:
            return 2

        case .white:
            return 7
        }
    }
}
