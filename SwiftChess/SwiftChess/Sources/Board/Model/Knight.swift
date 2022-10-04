//
//  Knight.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/04.
//

struct Knight: Piece {
    static var point: Int = 3
    static var maxCount: Int = 2
    static var moveRules: Set<MoveRule> = [
        MoveRule(file: .increment(.one), rank: .increment(.two)),
        MoveRule(file: .increment(.one), rank: .decrement(.two)),
        MoveRule(file: .increment(.two), rank: .increment(.one)),
        MoveRule(file: .increment(.two), rank: .decrement(.one)),
        MoveRule(file: .decrement(.one), rank: .increment(.two)),
        MoveRule(file: .decrement(.one), rank: .decrement(.two)),
        MoveRule(file: .decrement(.two), rank: .increment(.one)),
        MoveRule(file: .decrement(.two), rank: .decrement(.one)),
    ]

    var color: PieceColor
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackKnight : .whiteKnight
    }

    func movableLocations(from location: BoardLocation) -> [BoardLocation] {
        return Self.moveRules.compactMap { location + $0 }
    }
}
