//
//  Position.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/27.
//

import Foundation

struct Position: Hashable {
  let rankIndex: Int
  let fileIndex: Int

  static let maxRanks: Int = 8
  static let maxFiles: Int = 8

  init?(rankIndex: Int, fileIndex: Int) {
    guard 0..<Self.maxRanks ~= rankIndex, 0..<Self.maxFiles ~= fileIndex else { return nil }
    self.rankIndex = rankIndex
    self.fileIndex = fileIndex
  }

  init?(string fileRankString: String) {
    guard fileRankString.count == 2 else { return nil }

    let indexOfFiles: [String: Int] = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7]
    let indexOfRanks: [String: Int] = ["1": 0, "2": 1, "3": 2, "4": 3, "5": 4, "6": 5, "7": 6, "8": 7]

    guard let fileIndex = indexOfFiles[String(fileRankString.prefix(1))],
          let rankIndex = indexOfRanks[String(fileRankString.suffix(1))] else { return nil }

    self.init(rankIndex: rankIndex, fileIndex: fileIndex)
  }
}

