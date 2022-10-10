//
//  Game.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/03.
//

import Foundation

final class Game {
  private let board = Board()
  private let validator = BoardInputValidator()
  
  init() {
    self.board.reset()
  }
}
