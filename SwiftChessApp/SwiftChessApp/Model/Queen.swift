//
//  Queen.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/02.
//

import Foundation

struct Queen: Piece {
  let player: Player

  var symbol: String {
    return player == .black ? "♛" : "♕"
  }

  var score: Int {
    return 9
  }

  static func makePiecesWithPosition() -> [PieceWithPosition] {
    let blackQueens = [Position(file: .E, rank: .R1)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Queen(player: .black), position: $0) }
    let whiteQueens = [Position(file: .E, rank: .R8)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Queen(player: .white), position: $0) }
    return blackQueens + whiteQueens
  }

  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position> {
    return validateNearestOrderedPositionsList(
      position.nearestOrderedPositions(.northWest),
      position.nearestOrderedPositions(.northEast),
      position.nearestOrderedPositions(.southWest),
      position.nearestOrderedPositions(.southEast),
      position.nearestOrderedPositions(.north),
      position.nearestOrderedPositions(.south),
      position.nearestOrderedPositions(.west),
      position.nearestOrderedPositions(.east),
      in: pieces ?? .single(.init(piece: self, position: position)))
  }
}
