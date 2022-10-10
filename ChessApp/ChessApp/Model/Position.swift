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
  
  func toCoordinate() -> (Int, Int) {
    (file.index, rank.index)
  }
}
