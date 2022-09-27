//
//  Pawn.swift
//  Chess
//
//  Created by Lychee Choi on 2022/09/27.
//

import Foundation

protocol PawnLogic {
  func moveablePositions() -> [PawnPosition]
}

class Pawn {
  
  // MARK: Const
  
  private enum Const {
    static let maxRank: Int = 8
  }
  
  
  // MARK: Properties
  
  let color: PawnColor
  var position: PawnPosition
  
  
  // MARK: Initializing
  
  init(color: PawnColor, position: PawnPosition) {
    self.color = color
    self.position = position
  }
  
  func configure(rank: Int, file: PawnPosition.File) {
    position.configure(rank: rank, file: file)
  }
  
  func configure(rank: Int) {
    position.configure(rank: rank)
  }
  
  func configure(file: PawnPosition.File) {
    position.configure(file: file)
  }
  
  
  // MARK: Display method
  
  func display() -> String {
    return position.file.display() + "\(position.rank)"
  }
}


// MARK: - Pawn Logic

extension Pawn: PawnLogic {
  
  func moveablePositions() -> [PawnPosition] {
    
    var positions: [PawnPosition] = []
    let currentRawValue = self.position.file.rawValue
    
    // 양 옆
    if let leftFile = PawnPosition.File(rawValue: currentRawValue - 1) {
      positions.append(
        PawnPosition(
          rank: self.position.rank,
          file: leftFile
        )
      )
    }
    
    if let rightFile = PawnPosition.File(rawValue: currentRawValue + 1) {
      positions.append(
        PawnPosition(
          rank: self.position.rank,
          file: rightFile
        )
      )
    }
    
    // 위 아래
    switch self.color {
    case .black:
      if let file = PawnPosition.File(rawValue: currentRawValue),
         self.position.rank + 1 < Const.maxRank {
        positions.append(
          PawnPosition(
            rank: self.position.rank + 1,
            file: file
          )
        )
      }
      
    case .white:
      if let file = PawnPosition.File(rawValue: currentRawValue),
         self.position.rank - 1 > 1 {
        positions.append(
          PawnPosition(
            rank: self.position.rank - 1,
            file: file
          )
        )
      }
    }
    
    return positions
  }
}
