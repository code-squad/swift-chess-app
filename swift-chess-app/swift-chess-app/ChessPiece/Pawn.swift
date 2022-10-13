//
//  Pawn.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/03.
//

import Foundation

struct Pawn: ChessPieceProtocol {
    let type: ChessType = .pawn

    var color: ChessPieceColor

    func getMovablePositions(from currentPosition: BoardPosition,
                             in chessBoard: ChessBoard) -> [BoardPosition] {
        return []
    }
}
