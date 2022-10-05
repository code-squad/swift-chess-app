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
    static let maxCount: InitialPieceCount = .eight
    static let point: CapturePoint = .one

    let color: PieceColor
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackPawn : .whitePawn
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
