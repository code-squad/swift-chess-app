//
//  Rank.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

enum Rank: Int, CaseIterable {
  case A = 0, B, C, D, E, F, G, H
  
  init?(_ rawValue: Character?) {
    guard let rawValue = rawValue,
          let intValue = Int(String(rawValue))
    else {
      return nil
    }
    
    self.init(rawValue: intValue)
  }
  
  init?(_ rawValue: Int) {
    let allValues = Self.allCases.map { $0.rawValue }
    guard allValues.contains(rawValue) else { return nil }
    
    self.init(rawValue: rawValue)
  }
  
  var toDisplay: String {
    String(describing: self)
  }
  
  var index: Int {
    self.rawValue
  }
}

extension Rank {
  static func + (left: Rank, right: Int) -> Rank? {
    Rank(left.index + right)
  }
  
  static func + (left: Int, right: Rank) -> Rank? {
    Rank(left + right.index)
  }
}
