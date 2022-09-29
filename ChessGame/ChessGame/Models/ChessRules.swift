//
//  ChessRules.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/28/22.
//

import Foundation

final class ChessRules {
    typealias BoardSize = (rank: Int, file: Int)
    
    let startingColor: Chess.PieceColor = .white
    let pawnCount: Int = 8
    let boardSize: BoardSize = (rank: 8, file: 8)
}
