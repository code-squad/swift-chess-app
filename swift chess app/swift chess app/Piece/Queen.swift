//
//  Queen.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import Foundation

struct Queen: Pieceable {
    static var maxCount: Int = 1
    static var score: Int = 9
    
    var color: PieceColor
    
    func isMovable(from: Location, to: Location) -> Bool {
        (abs(from.row - to.row) == abs(from.col - to.col)) ||
        (from.row == to.row || from.col == to.col)
    }
}
