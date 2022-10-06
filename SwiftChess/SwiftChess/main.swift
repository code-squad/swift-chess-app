//
//  main.swift
//  SwiftChess
//
//  Created by Sunghyun Kim on 2022/10/06.
//

import Foundation

struct Position {
    var rank: Int
    var file: Int
}

enum Color {
    case black
    case white
}

protocol Piece {
    var color: Color { get }
    var position: Position { get }
}

struct King: Piece {
    let color: Color
    var position: Position
}

struct Board {
    var data: [[Piece?]]
    
    init() {
        let rank = [Piece?](repeating: nil, count: 8)
        data = [[Piece?]](repeating: rank, count: 8)
    }
}
