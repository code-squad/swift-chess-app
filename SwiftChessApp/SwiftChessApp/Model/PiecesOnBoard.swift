//
//  PiecesOnBoard.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/02.
//

import Foundation

struct PiecesOnBoard {
  private var pieces: [[Piece?]]

  var scores: [Player: Int] {
    let playerPieces = pieces.flatMap { $0 }.compactMap { $0 }
    return playerPieces.reduce(into: [.black: 0, .white: 0]) { counts, piece in
      counts[piece.player, default: 0] += piece.score
    }
  }

  init() {
    pieces = .init(
      repeating: .init(
        repeating: nil,
        count: Position.File.allCases.count
      ),
      count: Position.Rank.allCases.count
    )
  }

  static func single(_ pieceWithPosition: PieceWithPosition) -> Self {
    var pieces = Self()
    pieces[position: pieceWithPosition.position] = pieceWithPosition.piece
    return pieces
  }

  static func multiple(_ piecesWithPosition: [PieceWithPosition]) -> Self {
    var pieces = Self()
    for pieceWithPosition in piecesWithPosition {
      pieces[position: pieceWithPosition.position] = pieceWithPosition.piece
    }
    return pieces
  }

  mutating func append(piecesOf piecesWithPosition: [PieceWithPosition]) {
    for pieceWithPosition in piecesWithPosition {
      self[position: pieceWithPosition.position] = pieceWithPosition.piece
    }
  }

  func availableNextPositions(from position: Position) -> Set<Position> {
    return self[position: position]?.availableNextPositions(from: position, in: self) ?? []
  }

  func canMovePiece(from sourcePosition: Position, to destinationPosition: Position) -> Bool {
    return availableNextPositions(from: sourcePosition).contains { $0 == destinationPosition }
  }

  @discardableResult
  mutating func movePiece(from sourcePosition: Position, to destinationPosition: Position) -> Bool {
    guard canMovePiece(from: sourcePosition, to: destinationPosition) else { return false }
    self[position: destinationPosition] = self[position: sourcePosition]
    self[position: sourcePosition] = nil
    return true
  }

  subscript(position position: Position?) -> Piece? {
    get {
      guard let position else { return nil }
      return pieces[position.rank.rawValue][position.file.rawValue]
    }
    set {
      guard let position else { return }
      pieces[position.rank.rawValue][position.file.rawValue] = newValue
    }
  }
}
