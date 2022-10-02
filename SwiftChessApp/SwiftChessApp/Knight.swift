//
//  Knight.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/02.
//

import Foundation

struct Knight: Piece {
  let player: Player

  var symbol: String {
    return player == .black ? "♞" : "♘"
  }

  var score: Int {
    return 3
  }

  static func makePiecesWithPosition() -> [PieceWithPosition] {
    let blackKnights = [Position(rankIndex: 0, fileIndex: 1), Position(rankIndex: 0, fileIndex: 6)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Knight(player: .black), position: $0) }
    let whiteKnights = [Position(rankIndex: 7, fileIndex: 1), Position(rankIndex: 7, fileIndex: 6)]
      .compactMap { $0 }
      .map { PieceWithPosition(piece: Knight(player: .white), position: $0) }
    return blackKnights + whiteKnights
  }

  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position> {
    let pieces = pieces ?? .single(.init(piece: self, position: position))

    let northPosition = position.nearestPosition(.north)
    let southPosition = position.nearestPosition(.south)
    let westPosition = position.nearestPosition(.west)
    let eastPosition = position.nearestPosition(.east)

    let validTargetPositions = validatePositions([northPosition, southPosition, westPosition, eastPosition], in: pieces)
    var destinationPositions = [Position?]()

    if let northPosition, validTargetPositions.contains(northPosition) {
      destinationPositions += [northPosition.nearestPosition(.northWest), northPosition.nearestPosition(.northEast)]
    }

    if let southPosition, validTargetPositions.contains(southPosition) {
      destinationPositions += [southPosition.nearestPosition(.southWest), southPosition.nearestPosition(.southEast)]
    }

    if let westPosition, validTargetPositions.contains(westPosition) {
      destinationPositions += [westPosition.nearestPosition(.northWest), westPosition.nearestPosition(.southWest)]
    }

    if let eastPosition, validTargetPositions.contains(eastPosition) {
      destinationPositions += [eastPosition.nearestPosition(.northEast), eastPosition.nearestPosition(.southEast)]
    }

    return validatePositions(destinationPositions, in: pieces)
  }
}
