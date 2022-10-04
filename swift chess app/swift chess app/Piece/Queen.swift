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
        Bishop(color: color).isMovable(from: from, to: to) ||
        Rook(color: color).isMovable(from: from, to: to)
    }
    
    func isBlocked(from: Location, to: Location, board: [[Pieceable?]]) -> Bool {
        var result: Bool
        if from.row != to.row && from.col != to.col {
            result = Bishop(color: color).isBlocked(from: from, to: to, board: board)
        } else {
            result = Rook(color: color).isBlocked(from: from, to: to, board: board)
        }
        
        return result
    }
}
