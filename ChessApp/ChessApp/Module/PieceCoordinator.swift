//
//  PieceCoordinator.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/11.
//

import Foundation

final class PieceCoordinator {
  
  private(set) var piecePosition: [[Piece]] = [[]]
  private let size: Int
  
  init(positionSize: Int) {
    self.size = positionSize
  }
  
  func reset() {
    self.piecePosition = [
      [Piece](repeating: Empty(), count: self.size),
      [Piece](repeating: Pawn(color: .black), count: self.size),
      [Piece](repeating: Empty(), count: self.size),
      [Piece](repeating: Empty(), count: self.size),
      [Piece](repeating: Empty(), count: self.size),
      [Piece](repeating: Empty(), count: self.size),
      [Piece](repeating: Pawn(color: .white), count: self.size),
      [Piece](repeating: Empty(), count: self.size),
    ]
  }
  
  func getPiece(indexs: (Int, Int)) -> Piece {
    self.piecePosition[indexs.0][indexs.1]
  }
  
  func setPiece(_ piece: Piece, indexs: (Int, Int)) {
    self.piecePosition[indexs.0][indexs.1] = piece
  }
}
