//
//  Pawn.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

struct Pawn: ChessPiece {
    let teamColor: TeamColor
    
    func canMove(from origin: Position, to destination: Position, board: Board) -> Bool {
        return true
    }
}
