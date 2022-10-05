//
//  Bishop.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/04.
//

struct Bishop: Piece {
    static let point: CapturePoint = .three
    static let maxCount: InitialPieceCount = .two
    static let moveRules: Set<MoveRule> = [
        MoveRule(file: .increment(.one  ), rank: .increment(.one  )),
        MoveRule(file: .increment(.two  ), rank: .increment(.two  )),
        MoveRule(file: .increment(.three), rank: .increment(.three)),
        MoveRule(file: .increment(.four ), rank: .increment(.four )),
        MoveRule(file: .increment(.five ), rank: .increment(.five )),
        MoveRule(file: .increment(.six  ), rank: .increment(.six  )),
        MoveRule(file: .increment(.seven), rank: .increment(.seven)),
        MoveRule(file: .increment(.one  ), rank: .decrement(.one  )),
        MoveRule(file: .increment(.two  ), rank: .decrement(.two  )),
        MoveRule(file: .increment(.three), rank: .decrement(.three)),
        MoveRule(file: .increment(.four ), rank: .decrement(.four )),
        MoveRule(file: .increment(.five ), rank: .decrement(.five )),
        MoveRule(file: .increment(.six  ), rank: .decrement(.six  )),
        MoveRule(file: .increment(.seven), rank: .decrement(.seven)),
        MoveRule(file: .decrement(.one  ), rank: .increment(.one  )),
        MoveRule(file: .decrement(.two  ), rank: .increment(.two  )),
        MoveRule(file: .decrement(.three), rank: .increment(.three)),
        MoveRule(file: .decrement(.four ), rank: .increment(.four )),
        MoveRule(file: .decrement(.five ), rank: .increment(.five )),
        MoveRule(file: .decrement(.six  ), rank: .increment(.six  )),
        MoveRule(file: .decrement(.seven), rank: .increment(.seven)),
        MoveRule(file: .decrement(.one  ), rank: .decrement(.one  )),
        MoveRule(file: .decrement(.two  ), rank: .decrement(.two  )),
        MoveRule(file: .decrement(.three), rank: .decrement(.three)),
        MoveRule(file: .decrement(.four ), rank: .decrement(.four )),
        MoveRule(file: .decrement(.five ), rank: .decrement(.five )),
        MoveRule(file: .decrement(.six  ), rank: .decrement(.six  )),
        MoveRule(file: .decrement(.seven), rank: .decrement(.seven)),
    ]

    var color: PieceColor
    var initialLocations: [BoardLocation] {
        switch color {
        case .black:
            return [
                BoardLocation(file: .C, rank: .one),
                BoardLocation(file: .F, rank: .one),
            ]

        case .white:
            return [
                BoardLocation(file: .C, rank: .eight),
                BoardLocation(file: .F, rank: .eight),
            ]
        }
    }
    var asSymbol: BoardElementSymbol {
        return color == .black ? .blackBishop : .whiteBishop
    }
}
