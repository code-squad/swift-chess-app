//
//  PiecesOnBoard.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/10/02.
//

import Foundation

typealias PiecesOnBoard = [[Piece?]]

extension PiecesOnBoard {
  init() {
    self.init(
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

  func symbol(position: Position) -> String {
    return self[position: position]?.symbol ?? "."
  }

  subscript(position position: Position?) -> Piece? {
    get {
      guard let position else { return nil }
      return self[position.rank.rawValue][position.file.rawValue]
    }
    set {
      guard let position else { return }
      self[position.rank.rawValue][position.file.rawValue] = newValue
    }
  }
}
