//
//  Piece.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

protocol Piece {
    var position: String { get set }
}

class Pawn: Piece {
    var position: String
    var color: Chess.PieceColor
    
    init(position: String, color: Chess.PieceColor) {
        self.position = position
        self.color = color
    }
}
