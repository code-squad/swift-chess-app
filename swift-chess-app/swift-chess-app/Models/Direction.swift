//
//  Direction.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

enum Direction: String {
    case n, ne, e, se, s, sw, w, nw
    
    var toString: String { rawValue.uppercased() }
    
    var toTuple: Tuple {
        switch self {
        case .n:
            return (row: -1, col: 0)
        case .ne:
            return (row: -1, col: 1)
        case .e:
            return (row: 0, col: 1)
        case .se:
            return (row: 1, col: 1)
        case .s:
            return (row: 1, col: 0)
        case .sw:
            return (row: 1, col: -1)
        case .w:
            return (row: 0, col: -1)
        case .nw:
            return (row: -1, col: -1)
        }
    }
}

extension Direction {
    
    static func + (left: Direction, right: Direction) -> Tuple {
        let vector1 = left.toTuple
        let vector2 = right.toTuple
        return (row: vector1.row + vector2.row, col: vector2.col + vector2.col)
    }
}
