//
//  Player.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/27.
//

import Foundation

enum Player {
  case black
  case white

  func forwardRankIndex(_ distance: Int) -> Int {
    switch self {
    case .black:
      return distance
    case .white:
      return -distance
    }
  }
}
