//
//  Rank.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

struct Rank: PositionType {
  var position: [String]
  var size: Int
  
  init?(position: [String], size: Int) {
    guard position.count == size else { return nil }
    
    self.position = position
    self.size = size
  }
  
  func index(value: String) -> Int? {
    guard self.position.contains(value) else { return nil }
    
    return self.position.firstIndex(of: value)
  }
}
