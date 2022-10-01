//
//  Queen.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import Foundation

struct Queen: Pieceable {
    static var maxCount: Int = 1
    
    var color: PieceColor
    
    func howToMove(from: Location, to: Location) -> Bool {
        (abs(from.rank - to.rank) == abs(from.file - to.file)) ||
        (from.rank == to.rank || from.file == to.file)
    }
}
