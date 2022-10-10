//
//  File.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

enum File: Int, CaseIterable {
  case one = 1, two, three, four, five, six, seven, eight
  
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
    String(self.rawValue)
  }
  
  var index: Int {
    self.rawValue - 1
  }
}

extension File {
  static func + (left: File, right: Int) -> File? {
    File(left.index + right)
  }
  
  static func + (left: Int, right: File) -> File? {
    File(left + right.index)
  }
}
