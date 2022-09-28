//
//  Chess.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

class Chess {
    var state: State = .ready
    var turn: PieceColor = .white
    var board: Board
    
    func start() {
        state = .inProgress
        turn = .white
    }
    
    func move(_ piece: Piece, to: String) {
        let isMoved = board.move(piece, to: to)
        
        if isMoved {
            changeTurn()
        }
    }
    
    private func changeTurn() {
        if turn == .black {
            turn = .white
        } else {
            turn = .black
        }
    }
    
    init(board: Board) {
        self.board = board
    }
    
    convenience init() {
        self.init(board: Board())
    }
}
