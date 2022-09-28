//
//  ChessGame.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

final class ChessGame {
    private let board = Board()
    private var pawn = Pawn(color: .black)
    
    func startGame() {
        board.startGame()
    }
    
    func move(from: Position, to: Position) {
        guard board.checkEnableToMove(pawn: pawn, from: from, to: to) else { return }
        board.move(pawn: pawn, from: from, to: to)
        pawn = pawn.color == .black ? Pawn(color: .white) : Pawn(color: .black)
    }
}
