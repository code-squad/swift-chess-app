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

extension Board {
  func display() -> String {
    var result = ""
    result += " ABCDEFGH\n"
    for rankIndex in 0..<Position.maxRanks {
      result += "\(rankIndex + 1)"
      for fileIndex in 0..<Position.maxFiles {
        if let position = Position(rankIndex: rankIndex, fileIndex: fileIndex) {
          result += "\(pieces.symbol(position: position))"
        }
      }
      result += "\n"
    }
    result += " ABCDEFGH"
    return result
  }

  func help(from position: Position?) -> String {
    guard let position = position,
          let availableNextPositions = pieces[position: position]?.availableNextPositions(from: position, in: pieces),
          availableNextPositions.count > 0 else { return "없음" }
    return Array(availableNextPositions).sorted { $0.rankIndex < $1.rankIndex }.sorted { $0.fileIndex < $1.fileIndex }.map { $0.fileRankString }.joined(separator: ",")
  }

  func helpDisplay(from position: Position?) -> String {
    guard let position = position, let availableNextPositions = pieces[position: position]?.availableNextPositions(from: position, in: pieces) else { return "No piece" }
    var result = ""
    result += " ABCDEFGH\n"
    for rankIndex in 0..<Position.maxRanks {
      result += "\(rankIndex + 1)"
      for fileIndex in 0..<Position.maxFiles {
        if let targetPosition = Position(rankIndex: rankIndex, fileIndex: fileIndex) {
          if availableNextPositions.contains(targetPosition) {
            result += "X"
          } else {
            result += "\(pieces.symbol(position: targetPosition))"
          }
        }
      }
      result += "\n"
    }
    result += " ABCDEFGH"
    return result
  }
}
