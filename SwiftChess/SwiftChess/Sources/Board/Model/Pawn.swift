//
//  Pawn.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

struct Pawn: Piece {
    static let maxCount: Int = 8

    let color: PieceColor

    var initialRankIndex: Int {
        switch color {
        case .black:
            return 1

        case .white:
            return 6
        }
    }
}
