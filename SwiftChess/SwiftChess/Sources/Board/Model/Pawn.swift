//
//  Pawn.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

/// 체스말 폰.
struct Pawn: Piece {
    static let moveRules: Set<MoveRule> = [
        MoveRule(file: .none, rank: .increment(.one))
    ]
    static let maxCount: Int = 8
    static let point: Int = 1

    let color: PieceColor
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackPawn : .whitePawn
    }

    /// 색상별 ``Pawn``이 최초에 위치할 수 있는 rank
    var initialRank: BoardLocation.Rank {
        switch color {
        case .black:
            return .two

        case .white:
            return .seven
        }
    }

    var initialLocations: [BoardLocation] {
        let allFiles = BoardLocation.File.allCases

        switch color {
        case .black:
            return allFiles.map { BoardLocation(file: $0, rank: .two) }

        case .white:
            return allFiles.map { BoardLocation(file: $0, rank: .seven) }
        }
    }
}

extension Pawn {

    func movableLocations(from location: BoardLocation) -> [BoardLocation] {
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
