//
//  main.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/06.
//

import Foundation

print("Hello, World!")

class Main {

    func test() -> String {
        return "this is test"
    }
}

enum Color {
    case black
    case white
}

struct Position {
    enum Rank {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
    }
    enum File {
        case A
        case B
        case C
        case D
        case E
        case F
        case G
        case H
    }
    let file: File
    let rank: Rank
}
protocol King {
    var color: Color { get }
    var position: Position { get }
}

class BlackKing: King {
    var color: Color { .black }
    private(set) var position: Position

    init(position: Position) {
        self.position = position
    }
}
