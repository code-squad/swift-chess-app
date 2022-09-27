//
//  ChessController.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/27.
//

import Foundation

class ChessController {
    private let board: Board
    
    var score: (black: Int, white: Int) { board.getScore() }
    
    init() {
        board = Board()
    }
    
    func move(inputString: String) -> Bool {
        guard let position = stringToChessPosition(inputString) else { return false }
        
        if !board.moveCheck(position.current, position.move) { return false }
        
        board.move(position.current, position.move)
        board.factionChange()
        
        return true
    }
    
    func display() -> String { board.display() }
}
