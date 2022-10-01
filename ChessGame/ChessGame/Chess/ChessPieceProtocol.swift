//
//  ChessPieceProtocol.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

protocol ChessPieceProtocol: Equatable {
    var teamColor: TeamColor { get }
    func canMove(from origin: Position, to destination: Position, board: ChessBoard) -> Bool
    var score: Int { get }
}
