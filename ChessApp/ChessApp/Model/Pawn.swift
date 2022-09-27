//
//  Pawn.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

struct Pawn: Piece {
  var shape: String
  var color: Color
  var value: Int
  
  init(color: Color) {
    self.color = color
    self.shape = color == .white ? "♙" : "♟"
    self.value = 1
  }
  
  func movablePositions(from: String) -> [String] {
    []
  }
}
