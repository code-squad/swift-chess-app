//
//  ChessPawn.swift
//  chessApp
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import Foundation

final class ChessPawn: ChessPiece {
  func isPieceRange(nextPosition: Position) -> Bool {
    var rank = self.position.rank
    rank += color == .white ? 1 : -1
    let isPieceRange: Bool = nextPosition.rank == rank
    return isPieceRange
  }
  
  func availableRange() -> [Position] {
    var position = self.position
    position.rank += color == .white ? 1 : -1
    return [position]
  }
}
