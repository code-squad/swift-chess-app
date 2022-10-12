//
//  File.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

enum File: Int, CaseIterable {
  case A = 0, B, C, D, E, F, G, H
  
  init?(_ rawValue: Character?) {
    let unicodeAValue = 65
    guard let unicodeValue = rawValue?.unicodeScalars.first?.value
    else {
      return nil
    }
    
    let intValue = Int(unicodeValue) - unicodeAValue
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

extension File {
  static func + (left: File, right: Int) -> File? {
    File(left.rawValue + right)
  }
  
  static func + (left: Int, right: File) -> File? {
    File(left + right.rawValue)
  }
}
