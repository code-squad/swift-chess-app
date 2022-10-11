//
//  Rook.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/02.
//

import Foundation

struct Rook: Piece {
  let player: Player

  var symbol: String {
    return player == .black ? "♜" : "♖"
  }

  var score: Int {
    return 5
  }

  static func makePiecesWithPosition() -> [PieceWithPosition] {
    let blackRooks = [Position(file: .A, rank: .R1), Position(file: .H, rank: .R1)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Rook(player: .black), position: $0) }
    let whiteRooks = [Position(file: .A, rank: .R8), Position(file: .H, rank: .R8)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Rook(player: .white), position: $0) }
    return blackRooks + whiteRooks
  }

  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position> {
    return validateNearestOrderedPositionsList(
      position.nearestOrderedPositions(.north),
      position.nearestOrderedPositions(.south),
      position.nearestOrderedPositions(.west),
      position.nearestOrderedPositions(.east),
      in: pieces ?? .single(.init(piece: self, position: position)))
  }
}
