//
//  Pawn.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/27.
//

import Foundation

struct Pawn: Piece {
  let player: Player

  var symbol: String {
    return player == .black ? "♟" : "♙"
  }

  var score: Int {
    return 1
  }

  func availableNextPositions(from position: Position) -> [Position] {
    return [
      Position(rankIndex: position.rankIndex + player.forwardRankIndex(1), fileIndex: position.fileIndex),
      Position(rankIndex: position.rankIndex, fileIndex: position.fileIndex + 1),
      Position(rankIndex: position.rankIndex, fileIndex: position.fileIndex - 1),
    ].compactMap { $0 }
  }
}
