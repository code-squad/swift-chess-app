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
