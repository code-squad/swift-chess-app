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
    setupBoard()
  }
}


// MARK: - Board Logic

extension Board: BoardLogic {
  
  func setupBoard() {
    // 2Rank는 흑색
    boardState[1].enumerated().forEach {
      if $0.element == .empty {
        boardState[1][$0.offset] = .black
      }
    }
    
    // 7Rank는 백색
    boardState[6].enumerated().forEach {
      if $0.element == .empty {
        boardState[6][$0.offset] = .white
      }
    }
    
    print("▶️ 체스 보드가 생성되었습니다.")
    display()
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
