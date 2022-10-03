//
//  Direction.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

enum Direction: String {
    
    case n, ne, e, se, s, sw, w, nw
    
    var toTuple: Tuple {
        switch self {
        case .n:
            return Tuple(row: -1, col: 0)
        case .ne:
            return Tuple(row: -1, col: 1)
        case .e:
            return Tuple(row: 0, col: 1)
        case .se:
            return Tuple(row: 1, col: 1)
        case .s:
            return Tuple(row: 1, col: 0)
        case .sw:
            return Tuple(row: 1, col: -1)
        case .w:
            return Tuple(row: 0, col: -1)
        case .nw:
            return Tuple(row: -1, col: -1)
        }
    }
}

extension Direction {
    
    static func + (left: Direction, right: Direction) -> Tuple {
        return Tuple(row: left.toTuple.row + right.toTuple.row, col: left.toTuple.col + right.toTuple.col)
    }
}
