//
//  main.swift
//  pair05a
//
//  Created by MK-AM16-010 on 2022/10/06.
//

import Foundation

struct BlackKing: Piece {
    var color: Color { .black }
    var position: Position
    
    init(position: Position = Position(rank: Rank.one, file: File.E)) {
        self.position = position
    }
}

struct WhiteKing: Piece {
    var color: Color { .white }
    var position: Position
    
    init(position: Position = Position(rank: Rank.eight, file: File.E)) {
        self.position = position
    }
}

enum Color {
    case white
    case black
}

protocol Piece {
    var color: Color { get }
    var position: Position { get set }
}

struct Position {
    let rank: Rank
    let file: File
}

enum Rank: Int {
    case one = 1, two, three, four, five, six, sevent, eight
}

enum File: Int {
    case A = 1, B, C, D, E, F, G, H
}
