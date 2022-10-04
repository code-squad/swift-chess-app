//
//  Rook.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import Foundation

struct Rook: Pieceable {
    static var maxCount: Int = 2
    static var score: Int = 5
    
    var color: PieceColor
    
    func isMovable(from: Location, to: Location) -> Bool {
        from.row == to.row || from.col == to.col
    }
    
    func isBlocked(from: Location, to: Location, board: [[Pieceable?]]) -> Bool {
        if from.row == to.row {
            let diff = max(from.col, to.col) - min(from.col, to.col)
            
            for i in 1 ..< diff {
                let col = from.col > to.col ? from.col - i : from.col + i
                
                guard board[from.row][col] == nil else { return true }
            }
        } else {
            let diff = max(from.row, to.row) - min(from.row, to.row)
            
            for i in 1 ..< diff {
                let row = from.row > to.row ? from.row - i : from.row + i
                
                guard board[row][from.col] == nil else { return true }
            }
        }
        
        return false
    }
}
