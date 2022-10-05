//
//  Rook.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/04.
//

struct Rook: Piece {
    static var point: CapturePoint = .five
    static var maxCount: InitialPieceCount = .two
    static var moveRules: Set<MoveRule> = [
        MoveRule(file: .increment(.one  ), rank: .none),
        MoveRule(file: .increment(.two  ), rank: .none),
        MoveRule(file: .increment(.three), rank: .none),
        MoveRule(file: .increment(.four ), rank: .none),
        MoveRule(file: .increment(.five ), rank: .none),
        MoveRule(file: .increment(.six  ), rank: .none),
        MoveRule(file: .increment(.seven), rank: .none),
        MoveRule(file: .decrement(.one  ), rank: .none),
        MoveRule(file: .decrement(.two  ), rank: .none),
        MoveRule(file: .decrement(.three), rank: .none),
        MoveRule(file: .decrement(.four ), rank: .none),
        MoveRule(file: .decrement(.five ), rank: .none),
        MoveRule(file: .decrement(.six  ), rank: .none),
        MoveRule(file: .decrement(.seven), rank: .none),
        MoveRule(file: .none, rank: .increment(.one  )),
        MoveRule(file: .none, rank: .increment(.two  )),
        MoveRule(file: .none, rank: .increment(.three)),
        MoveRule(file: .none, rank: .increment(.four )),
        MoveRule(file: .none, rank: .increment(.five )),
        MoveRule(file: .none, rank: .increment(.six  )),
        MoveRule(file: .none, rank: .increment(.seven)),
        MoveRule(file: .none, rank: .decrement(.one  )),
        MoveRule(file: .none, rank: .decrement(.two  )),
        MoveRule(file: .none, rank: .decrement(.three)),
        MoveRule(file: .none, rank: .decrement(.four )),
        MoveRule(file: .none, rank: .decrement(.five )),
        MoveRule(file: .none, rank: .decrement(.six  )),
        MoveRule(file: .none, rank: .decrement(.seven)),
    ]

    var color: PieceColor
    var initialLocations: [BoardLocation] {
        switch color {
        case .black:
            return [
                BoardLocation(file: .A, rank: .one),
                BoardLocation(file: .H, rank: .one),
            ]

        case .white:
            return [
                BoardLocation(file: .A, rank: .eight),
                BoardLocation(file: .H, rank: .eight),
            ]
        }
    }
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackRook : .whiteRook
    }
}
