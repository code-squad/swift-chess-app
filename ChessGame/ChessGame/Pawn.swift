//
//  Pawn.swift
//  ChessGame
//
//  Created by Ador on 2022/10/05.
//

import Foundation

protocol Markable {

    var mark: Int { get }
}

protocol Printable {

    var rawValue: String { get }
}

protocol Movable {

    typealias Position = Board.Position

    var position: Position { get }

    func move(to: Position)
}

class Piece: Movable, Printable {

    typealias Position = Board.Position

    enum Color: CaseIterable {
        case black
        case white
    }

    let color: Color
    private(set) var position: Position

    var rawValue: String {
        return "."
    }

    init(color: Color, position: Position) {
        self.color = color
        self.position = position
    }

    func move(to position: Position) {
        self.position = position
    }
}

class Pawn: Piece, Markable {

    let mark: Int = 1

    override var rawValue: String {
        let char: String
        switch color {
        case .black:
            char = "♟"
        case .white:
            char = "♙"
        }
        return char
    }
}

class Bishop: Piece, Markable {

    let mark: Int = 3

    override var rawValue: String {
        let char: String
        switch color {
        case .black:
            char = "♝"
        case .white:
            char = "♗"
        }
        return char
    }
}

class Rook: Piece, Markable {

    let mark: Int = 5

    override var rawValue: String {
        let char: String
        switch color {
        case .black:
            char = "♜"
        case .white:
            char = "♖"
        }
        return char
    }
}
