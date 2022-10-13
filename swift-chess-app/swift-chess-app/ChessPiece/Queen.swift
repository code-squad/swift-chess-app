//
//  Queen.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/06.
//

import Foundation

struct Queen: ChessPieceProtocol {

    let type: ChessType = .queen

    var color: ChessPieceColor

    func getMovablePositions(from currentPosition: BoardPosition,
                             in chessBoard: ChessBoard) -> [BoardPosition] {
        return []
    }
}
