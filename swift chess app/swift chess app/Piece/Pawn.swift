//
//  Pawn.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

struct Pawn: Pieceable {
    static let maxCount: Int = 8
    
    let color: PieceColor
    
    func howToMove(from: Location, to: Location) -> Bool {
        switch color {
        case .black:
            return from.rank - to.rank == -1
        case .white:
            return from.rank - to.rank == 1
        }
    }
}
