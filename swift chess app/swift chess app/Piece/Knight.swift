//
//  Knight.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/10/01.
//

import Foundation

struct Knight: Pieceable {
    static var maxCount: Int = 2
    
    var color: PieceColor
    
    func howToMove(from: Location, to: Location) -> Bool {
        false
    } 
}
