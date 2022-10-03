//
//  PositionType.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/02.
//

import Foundation

protocol PositionType {
  var position: [String] { get }
  
  func index(value: String) -> Int?
}

extension PositionType {
  func index(value: String) -> Int? {
    guard self.position.contains(value) else { return nil }
    
    return self.position.firstIndex(of: value)
  }
}
