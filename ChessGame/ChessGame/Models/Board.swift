//
//  Board.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

protocol Board {
    var pieces: [Piece] { get set }
    
    func reset()
    func move(_ piece: Piece, to: String) -> Bool
}

class ChessBoard: Board {
    var pieces: [Piece] = []
    
    func reset() {
        pieces.removeAll()
    }
    
    func move(_ piece: Piece, to: String) -> Bool {
        
        return true
    }
}
