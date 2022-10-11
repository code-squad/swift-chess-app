//
//  Board.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/26.
//

import Foundation

class Board {
  private(set) var pieces = PiecesOnBoard()

  var scores: [Player: Int] {
    let playerPieces = pieces.flatMap { $0 }.compactMap { $0 }
    return playerPieces.reduce(into: [.black: 0, .white: 0]) { counts, piece in
      counts[piece.player, default: 0] += piece.score
    }
  }

  init() {
    setupPieces()
  }

  private func setupPieces() {
    var pieces = PiecesOnBoard()
    pieces.append(piecesOf: Pawn.makePiecesWithPosition())
    pieces.append(piecesOf: Bishop.makePiecesWithPosition())
    pieces.append(piecesOf: Rook.makePiecesWithPosition())
    pieces.append(piecesOf: Queen.makePiecesWithPosition())
    pieces.append(piecesOf: Knight.makePiecesWithPosition())
    self.pieces = pieces
  }

  @discardableResult
  func move(from sourcePosition: Position?, to destinationPosition: Position?) -> Bool {
    guard let sourcePosition, let destinationPosition, canMove(from: sourcePosition, to: destinationPosition) else { return false }
    pieces[position: destinationPosition] = pieces[position: sourcePosition]
    pieces[position: sourcePosition] = nil
    return true
  }

  private func canMove(from sourcePosition: Position, to destinationPosition: Position) -> Bool {
    return (pieces[position: sourcePosition]?.availableNextPositions(from: sourcePosition, in: pieces) ?? []).contains { $0 == destinationPosition }
  }
}
