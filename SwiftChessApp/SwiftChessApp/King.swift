//
//  King.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/10.
//

import Foundation

struct King: Piece {
  var player: Player

  var symbol: String {
    return player == .black ? "♚" : "♔"
  }

  var score: Int {
    return 0
  }

  static func makePiecesWithPosition() -> [PieceWithPosition] {
    let blackKing = [Position(file: .D, rank: .R1)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: King(player: .black), position: $0) }
    let whiteKing = [Position(file: .D, rank: .R8)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: King(player: .white), position: $0) }
    return blackKing + whiteKing
  }

  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position> {
    return validatePositions([
        position.nearestPosition(.northWest),
        position.nearestPosition(.northEast),
        position.nearestPosition(.southWest),
        position.nearestPosition(.southEast),
        position.nearestPosition(.north),
        position.nearestPosition(.south),
        position.nearestPosition(.west),
        position.nearestPosition(.east),
    ], in: pieces ?? .single(.init(piece: self, position: position)))
  }
}
