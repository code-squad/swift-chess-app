//
//  Bishop.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/03.
//

import Foundation

struct Bishop: ChessPieceProtocol {
    let type: ChessType = .bishop

    var color: ChessPieceColor

    ///  대각선
    func getMovablePositions(from currentPosition: BoardPosition,
                             in chessBoard: ChessBoard) -> [BoardPosition] {
        // 3,3
        // 2,2 1,1 - -
        // 2,4 1,5 - +
        // 3,2 2,1 + -
        // 4,4 5,5 + +

        var movablePositions = [BoardPosition]()
        for i in 1..<currentPosition.rank.value {
            movablePositions.append(BoardPosition(rank: i, file: i))
            if i < chessBoard.column {
                movablePositions.append(BoardPosition(rank: i, file: chessBoard.column - i))
            }
        }

        for i in currentPosition.rank.value..<chessBoard.row {
            movablePositions.append(BoardPosition(rank: i, file: i))
            if i > 0 {
                movablePositions.append(BoardPosition(rank: i, file: chessBoard.column - i))
            }
        }
        print(movablePositions)
        return movablePositions
    }
}
