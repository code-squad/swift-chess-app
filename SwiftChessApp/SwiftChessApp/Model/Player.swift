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

  var name: String {
    switch self {
    case .black:
      return "Black"
    case .white:
      return "White"
    }
  }

  mutating func toggle() {
    switch self {
    case .black:
      self = .white
    case .white:
      self = .black
    }
  }
}
