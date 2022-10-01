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
    
    func move(from: Location, to: Location) -> Bool {
        abs(from.rank - to.rank) == abs(from.file - to.file)
    }
}
