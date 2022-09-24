//
//  ChessPieceProtocol.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

protocol ChessPieceProtocol {
    func canMove(from origin: Position, to destination: Position) -> Bool
}
