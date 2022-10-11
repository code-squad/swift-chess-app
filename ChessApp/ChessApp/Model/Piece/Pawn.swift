//
//  Pawn.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

struct Pawn: Piece {
  var color: Color

  var shape: String {
    self.color == .white ? "♙" : "♟"
  }
  
  var point: Int {
    1
  }
  
  var movableFileIndex: Int {
    0
  }
  
  var movableRankIndex: Int {
    self.color == .white ? -1 : 1
  }
  
  init(color: Color) {
    self.color = color
  }
  
  func movablePositions(from: Position) -> [Position] {
    guard let movedFile = from.move(fileIndex: self.movableFileIndex),
          let movedRank = from.move(rankIndex: self.movableRankIndex)
    else {
      return []
    }
    
    return [Position(file: movedFile, rank: movedRank)]
  }
}
