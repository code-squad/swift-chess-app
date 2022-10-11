//
//  Empty.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/10.
//

import Foundation

struct Empty: Piece {
  var shape: String {
    "."
  }
  
  var color: Color
  
  var point: Int {
    0
  }
  
  init() {
    self.color = .none
  }
  
  func movablePositions(from: Position) -> [Position] {
    return []
  }
}
