//
//  Bishop.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

struct Bishop: Pieceable {
    static let maxCount: Int = 2
    static var score: Int = 3
    
    let color: PieceColor
    
    func isMovable(from: Location, to: Location) -> Bool {
        abs(from.row - to.row) == abs(from.col - to.col)
    }
    
    func isBlocked(from: Location, to: Location, board: [[Pieceable?]]) -> Bool {
        let diff = max(from.row, to.row) - min(from.row, to.row)
        
        for i in 1 ..< diff {
            let row = from.row > to.row ? from.row - i : from.row + i
            let col = from.col > to.col ? from.col - i : from.col + i
            
            guard board[row][col] == nil else { return true }
        }
        
        return false
    }
}
