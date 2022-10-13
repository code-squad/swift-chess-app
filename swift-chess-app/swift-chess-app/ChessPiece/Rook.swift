//
//  Rook.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/03.
//

import Foundation

struct Rook: ChessPieceProtocol {

    let type: ChessType = .rook

    var color: ChessPieceColor

    func getMovablePositions(from currentPosition: BoardPosition,
                             in chessBoard: ChessBoard) -> [BoardPosition] {
        var movablePositions = [BoardPosition]()
        for i in 1..<chessBoard.row {
            if i != currentPosition.rank.value {
                movablePositions.append(BoardPosition(rank: currentPosition.rank.value, file: i))
            }
        }

        for i in 1..<chessBoard.column {
            if i != currentPosition.file.value {
                movablePositions.append(BoardPosition(rank: i, file: currentPosition.file.value))
            }
        }
        print(movablePositions)
        return movablePositions
    }
}
