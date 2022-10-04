//
//  Queen.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/04.
//

struct Queen: Piece {
    static var point: Int = 9
    static var maxCount: Int = 1
    static var moveRules: Set<MoveRule> = Bishop.moveRules.union(Rook.moveRules)

    var color: PieceColor
    var initialLocations: [BoardLocation] {
        switch color {
        case .black:
            return [
                BoardLocation(file: .E, rank: .one),
            ]

        case .white:
            return [
                BoardLocation(file: .E, rank: .eight),
            ]
        }
    }
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackQueen : .whiteQueen
    }
}
