//
//  Knight.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/06.
//

import Foundation

struct Knight: ChessPieceProtocol {

    let type: ChessType = .knight

    var color: ChessPieceColor

    func getMovablePositions(from currentPosition: BoardPosition,
                             in chessBoard: ChessBoard) -> [BoardPosition] {
        return []
    }
}
