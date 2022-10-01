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
    
    func move(from: Location, to: Location) -> Bool {
        from.rank == to.rank || from.file == to.file
    }
}
