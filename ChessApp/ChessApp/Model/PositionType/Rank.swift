//
//  Rank.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

enum Rank: Int {
  case A = 0, B, C, D, E, F, G, H
  
  init?(_ rawValue: Character?) {
    guard let rawValue = rawValue,
          let intValue = Int(String(rawValue))
    else {
      return nil
    }
    
    self = .init(rawValue: intValue) ?? .A
  }
  
  var toDisplay: String {
    String(describing: self)
  }
  
  var index: Int {
    self.rawValue
  }
}
