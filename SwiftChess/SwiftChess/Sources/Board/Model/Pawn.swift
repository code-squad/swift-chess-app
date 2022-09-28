//
//  Pawn.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

struct Pawn: Piece {
    static let moveRules: Set<MoveRule> = [MoveRule(rank: 1, file: 0)]
    static let maxCount: Int = 8
    static let point: Int = 1

    let color: PieceColor

    /// 색상별 ``Pawn``이 최초에 위치할 수 있는 rank
    var initialRank: Int {
        switch color {
        case .black:
            return 2

        case .white:
            return 7
        }
    }
}

extension Pawn {

    func movableLocations(
        from location: Board.Location
    ) -> [Board.Location] {
        guard let moveRule = Self.moveRules.first else { return [] }

        switch color {
        case .black:
            return [location + moveRule]
                .filter(\.isValid)

        case .white:
            return [location - moveRule]
                .filter(\.isValid)
        }
    }
}
