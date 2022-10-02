//
//  Pawn.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

struct Pawn: Pieceable {
    static let maxCount: Int = 8
    static var score: Int = 1
    
    let color: PieceColor
    
    func isMovable(from: Location, to: Location) -> Bool {
        switch color {
        case .black:
            return from.row - to.row == -1
        case .white:
            return from.row - to.row == 1
        }
    }
}
