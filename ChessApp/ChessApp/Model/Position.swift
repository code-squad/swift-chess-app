//
//  Position.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

struct Position {
  let file: any PositionType
  let rank: any PositionType
  
  init(file: some PositionType, rank: some PositionType) {
    self.file = file
    self.rank = rank
  }
}
