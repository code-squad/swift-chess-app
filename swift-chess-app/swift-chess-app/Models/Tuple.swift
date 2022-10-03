//
//  Tuple.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

struct Tuple {
    
    let row: Int
    
    let col: Int
    
    static var empty: Tuple { Tuple(row: 0, col: 0) }
}

extension Tuple {
    
    static func + (left: Tuple, right: Tuple) -> Tuple {
        return Tuple(row: left.row + right.row, col: left.col + right.col)
    }
}
