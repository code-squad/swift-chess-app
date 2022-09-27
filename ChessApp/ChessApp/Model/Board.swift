//
//  Board.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

final class Board {
  
  private let file: [String] = ["A", "B", "C", "D", "E", "F", "G", "H"]
  private let rank: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
  
  private var position: [[Piece?]] = [[]]
  private var score: [Color: Int] = [.black: 0, .white: 0]
  
  init() {
    self.reset()
  }
  
  func reset() {
    self.position = [
      Array(repeating: nil, count: 8),
      Array(repeating: Pawn(color: .black), count: 8),
      Array(repeating: nil, count: 8),
      Array(repeating: nil, count: 8),
      Array(repeating: nil, count: 8),
      Array(repeating: nil, count: 8),
      Array(repeating: nil, count: 8),
      Array(repeating: Pawn(color: .white), count: 8),
      Array(repeating: nil, count: 8),
    ]
    
    self.configureScore()
  }
  
  func configureScore() {
    let blackScore = self.position.flatMap { $0 }.filter { $0?.color == .black }
      .reduce(into: 0) { $0 += ($1?.value ?? 0 )}
    
    let whiteScore = self.position.flatMap { $0 }.filter { $0?.color == .white }
      .reduce(into: 0) { $0 += ($1?.value ?? 0 )}
    
    self.score = [.black: blackScore, .white: whiteScore]
  }
  
}
