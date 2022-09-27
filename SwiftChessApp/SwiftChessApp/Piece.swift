//
//  Piece.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/27.
//

import Foundation

protocol Piece {
  var player: Player { get }
  var symbol: String { get }
  var score: Int { get }
  func availableNextPositions(from position: Position) -> [Position]
}

extension Piece {
  func canMove(from sourcePosition: Position, to destinationPosition: Position) -> Bool {
    return availableNextPositions(from: sourcePosition).contains { $0 == destinationPosition }
  }
}

extension [[Piece?]] {
  subscript(position position: Position?) -> Piece? {
    get {
      guard let position else { return nil }
      return self[position.rankIndex][position.fileIndex]
    }
    set {
      guard let position else { return }
      self[position.rankIndex][position.fileIndex] = newValue
    }
  }
}
