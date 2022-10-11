//
//  Position.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

struct Position {
  let file: File
  let rank: Rank
  
  init(file: File, rank: Rank) {
    self.file = file
    self.rank = rank
  }
  
  init(value: String) throws {
    guard let file = File(value.first) else {
      throw BoardError.invalidFile
    }
    
    guard let rank = Rank(value.last) else {
      throw BoardError.invalidRank
    }
    
    self.file = file
    self.rank = rank
  }
  
  func move(fileIndex: Int) -> File? {
    self.file + fileIndex
  }
  
  func move(rankIndex: Int) -> Rank? {
    self.rank + rankIndex
  }
  
  func toCoordinate() -> (Int, Int) {
    (file.index, rank.index)
  }
}

extension Position: Equatable {
  public static func == (lhs: Position, rhs: Position) -> Bool {
    lhs.toCoordinate() == rhs.toCoordinate()
  }
}
