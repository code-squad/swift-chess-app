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
  
  init(color: Color) {
    self.color = color
  }
  
  func movablePositions(from: Position) -> Result<[Position], BoardError> {
    let movableFileIndex = 0
    let movableRankIndex = self.color == .white ? -1 : 1
    
    let file = from.file + movableFileIndex
    guard let file = file else { return .failure(.notMovableFile) }
    
    let rank = from.rank + movableRankIndex
    guard let rank = rank else { return .failure(.notMovableRank) }
    
    return .success([Position(file: file, rank: rank)])
  }
}
