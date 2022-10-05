//
//  File.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

enum File: Int {
  case one = 1, two, three, four, five, six, seven, eight
  
  init?(_ rawValue: Character?) {
    guard let rawValue = rawValue,
          let intValue = Int(String(rawValue))
    else {
      return nil
    }
    
    self = .init(rawValue: intValue) ?? .one
  }
  
  var toDisplay: String {
    String(self.rawValue)
  }
  
  var index: Int {
    self.rawValue - 1
  }
}
