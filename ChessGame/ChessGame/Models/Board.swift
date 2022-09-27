//
//  Board.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

protocol BoardType {
    var pieces: [Piece] { get set }
    func reset()
}

class Board: BoardType {
    var pieces: [Piece] = []
    
    func reset() {
        pieces.removeAll()
    }
}
