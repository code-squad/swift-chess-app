//
//  PawnPosition.swift
//  Chess
//
//  Created by Lychee Choi on 2022/09/27.
//

import Foundation

class PawnPosition: Equatable {
  
  // MARK: Equtable
  
  static func == (lhs: PawnPosition, rhs: PawnPosition) -> Bool {
    return lhs.rank == rhs.rank
      && lhs.file.rawValue == rhs.file.rawValue
  }
  
  
  // MARK: Properties
  
  var rank: Int
  var file: File
  
  
  // MARK: Initializing
  
  init(rank: Int, file: File) {
    self.rank = rank
    self.file = file
  }
  
  
  // MARK: configuring
  
  func configure(rank: Int, file: File) {
    self.rank = rank
    self.file = file
  }
  
  func configure(rank: Int) {
    self.rank = rank
  }
  
  func configure(file: File) {
    self.file = file
  }
}

extension PawnPosition {
  enum File: Int {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    
    func display() -> String {
      switch self {
      case .a:
        return "A"
      case .b:
        return "B"
      case .c:
        return "C"
      case .d:
        return "D"
      case .e:
        return "E"
      case .f:
        return "F"
      case .g:
        return "G"
      case .h:
        return "H"
      }
    }
  }
}
