//
//  Bishop.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/02.
//

import Foundation

struct Bishop: Piece {
  let player: Player

  var symbol: String {
    return player == .black ? "♝" : "♗"
  }

  var score: Int {
    return 3
  }

  static func makePiecesWithPosition() -> [PieceWithPosition] {
    let blackBishops = [Position(file: .C, rank: .R1), Position(file: .F, rank: .R1)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Bishop(player: .black), position: $0) }
    let whiteBishops = [Position(file: .C, rank: .R8), Position(file: .F, rank: .R8)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Bishop(player: .white), position: $0) }
    return blackBishops + whiteBishops
  }

  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position> {
    return validateNearestOrderedPositionsList(
      position.nearestOrderedPositions(.northWest),
      position.nearestOrderedPositions(.northEast),
      position.nearestOrderedPositions(.southWest),
      position.nearestOrderedPositions(.southEast),
      in: pieces ?? .single(.init(piece: self, position: position)))
  }
}
