//
//  Chess.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

final class Chess {
    private(set) var rule: ChessRules
    var state: State = .ready
    var turn: PieceColor?
    var board: Board
    
    func start() {
        state = .inProgress
        turn = rule.startingColor
        reset()
    }
    
    func reset() {
        board.resetPieces()
    }
    
    private func changeTurn() {
        if turn == .black {
            turn = .white
        } else {
            turn = .black
        }
    }
    
    init(rule: ChessRules, board: Board) {
        self.rule = rule
        self.board = board
    }
    
    convenience init() {
        let rule = ChessRules.shared
        let board = ChessBoard()
        self.init(rule: rule, board: board)
    }
}


// MARK: - BoardDelegate
extension Chess: BoardDelegate {
    func didMoved(isMoved: Bool) {
        if isMoved {
            changeTurn()
        }
    }
}
