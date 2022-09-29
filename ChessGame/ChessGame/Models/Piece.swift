//
//  Piece.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

protocol Piece {
    var color: Chess.PieceColor { get }
}

final class Pawn: Piece {
    var color: Chess.PieceColor
    
    init(color: Chess.PieceColor) {
        self.color = color
    }
}
