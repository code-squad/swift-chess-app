//
//  Knight.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/04.
//

struct Knight: Piece {
    static let point: CapturePoint = .three
    static let maxCount: InitialPieceCount = .two
    static let moveRules: Set<MoveRule> = [
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
    var initialLocations: [BoardLocation] {
        switch color {
        case .black:
            return [
                BoardLocation(file: .B, rank: .one),
                BoardLocation(file: .G, rank: .one),
            ]

        case .white:
            return [
                BoardLocation(file: .B, rank: .eight),
                BoardLocation(file: .G, rank: .eight),
            ]
        }
    }
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackKnight : .whiteKnight
    }
}
