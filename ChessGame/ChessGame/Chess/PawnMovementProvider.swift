//
//  PawnMovementProvider.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct PawnMovementProvider: PieceMovementProviding {
    func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        guard origin.file == destination.file else { return false }
        let rankDelta = destination.rank - origin.rank
        // 상위 함수에서 board에 말이 있음을 검증하기 때문에 강제 옵셔널 언래핑한다.
        let isWhite = board[origin]!.teamColor == .white
        let expectedDelta = isWhite ? 1 : -1
        return rankDelta == expectedDelta
    }
}
