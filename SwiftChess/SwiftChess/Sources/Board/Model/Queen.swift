//
//  Queen.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/04.
//

struct Queen: Piece {
    static let point: CapturePoint = .nine
    static let maxCount: InitialPieceCount = .one
    static let moveRules: Set<MoveRule> = Bishop.moveRules.union(Rook.moveRules)

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
