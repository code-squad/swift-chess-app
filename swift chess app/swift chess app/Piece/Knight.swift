//
//  Knight.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import Foundation

struct Knight: Pieceable {
    static var maxCount: Int = 2
    static var score: Int = 3
    
    var color: PieceColor
    
    func isMovable(from: Location, to: Location) -> Bool {
        (abs(from.row - to.row) == 2 && abs(from.col - to.col) == 1) ||
        (abs(from.row - to.row) == 1 && abs(from.col - to.col) == 2)
    } 
}
