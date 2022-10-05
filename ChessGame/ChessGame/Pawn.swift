//
//  Pawn.swift
//  ChessGame
//
//  Created by Ador on 2022/10/05.
//

import Foundation

protocol Piece {
    var rawValue: String { get }
}

struct None: Piece {
    var rawValue: String {
        return "."
    }
}

enum Pawn: String, Piece {
    case black = "♟"
    case white = "♙"
}
