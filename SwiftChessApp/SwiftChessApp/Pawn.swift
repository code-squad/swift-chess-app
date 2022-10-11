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

  static func makePiecesWithPosition() -> [PieceWithPosition] {
    let blackPawns = Position.File.allCases
      .map { Position(file: $0, rank: .R1) }
      .map { PieceWithPosition(piece: Pawn(player: .black), position: $0) }
    let whitePawns = Position.File.allCases
      .map { Position(file: $0, rank: .R6) }
      .map { PieceWithPosition(piece: Pawn(player: .white), position: $0) }
    return blackPawns + whitePawns
  }

  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position> {
    return validatePositions(
      [position.forward(player: player), position.nearestPosition(.west), position.nearestPosition(.east)],
      in: pieces ?? .single(.init(piece: self, position: position)))
  }
}
