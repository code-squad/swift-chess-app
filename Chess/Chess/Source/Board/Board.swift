//
//  Board.swift
//  Chess
//
//  Created by Lychee Choi on 2022/09/27.
//

import Foundation

protocol BoardLogic {
  func setupBoard()
  func calcScore()
  func display()
  func move(from: PawnPosition, to: PawnPosition) -> Bool
}

class Board {

  // MARK: Const
  
  private enum Const {
    static let maxRank: Int = 8
    static let maxFile: Int = 8
    static let maxPawnCount: Int = 8
    static let pawnScore: Int = 1
  }
  
  
  // MARK: Properties
  
  var boardState: [[BoardState]]

  
  // MARK: Initializing
  
  init() {
    // setup Board
    boardState = Array(
      repeating: Array(
        repeating: BoardState.empty,
        count: Const.maxFile
      ),
      count: Const.maxRank
    )
  }
}


// MARK: - Board Logic

extension Board: BoardLogic {
  
  func setupBoard() {
  }
  
  func calcScore() {
  }
  
  func display() {
    print(" ","A","B","C","D","E","F","G","H")
    boardState.enumerated().forEach { rank in
      var display: [String] = ["\(rank.offset + 1)"]
      rank.element.forEach { file in
        display.append(file.rawValue)
      }
      print(display.joined(separator: " "))
    }
  }
  
  func move(from: PawnPosition, to: PawnPosition) -> Bool {
  }
}
