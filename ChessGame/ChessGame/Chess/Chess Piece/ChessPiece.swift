//
//  ChessPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

protocol ChessPiece {
    var teamColor: TeamColor { get }
    func canMove(from origin: Position, to destination: Position, board: Board) -> Bool
}
