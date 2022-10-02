//
//  Pawn.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

/// 체스말 폰.
struct Pawn: Piece {
    static let moveRules: Set<MoveRule> = [MoveRule(file: .none, rank: .increment(.one))]
    static let maxCount: Int = 8
    static let point: Int = 1

    let color: PieceColor
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackPawn : .whitePawn
    }

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
        Self.moveRules.flatMap { moveRule in
            switch color {
            case .black:
                return [location + moveRule]
                    .compactMap { $0 }

            case .white:
                return [location - moveRule]
                    .compactMap { $0 }
            }
        }
    }
}
