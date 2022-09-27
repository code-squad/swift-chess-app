//
//  Position.swift
//  chessApp
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import Foundation

struct Position: Equatable {
  var rank: Int
  var file: Int
}

extension Position {
  init?(_ string: String) {
    let stringArray = Array(string)
    guard stringArray.count == 2 else { return nil }
    if let textValue = stringArray[0].unicodeScalars.first,
       let rankValue = Int(String(stringArray[1])) {
      let file = Int(UInt8(ascii: textValue) - UInt8(ascii: "A"))
      guard file >= 0, rankValue > 0 else { return nil }
      self.init(rank: rankValue - 1, file: file)
    }
    return nil
  }
}
