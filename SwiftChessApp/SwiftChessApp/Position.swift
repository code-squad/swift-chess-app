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
}

// TODO
extension Position {
  static let indexOfFiles: [String: Int] = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7]
  static let indexOfRanks: [String: Int] = ["1": 0, "2": 1, "3": 2, "4": 3, "5": 4, "6": 5, "7": 6, "8": 7]

  init?(string fileRankString: String) {
    guard fileRankString.count == 2 else { return nil }

    guard let fileIndex = Self.indexOfFiles[String(fileRankString.prefix(1))],
          let rankIndex = Self.indexOfRanks[String(fileRankString.suffix(1))] else { return nil }

    self.init(rankIndex: rankIndex, fileIndex: fileIndex)
  }

  var fileRankString: String {
    guard let fileString = Self.indexOfFiles.first(where: { $1 == fileIndex })?.key, let rankString = Self.indexOfRanks.first(where: { $1 == rankIndex })?.key else { return "" }
    return "\(fileString)\(rankString)"
  }
}

extension Position {
  func relativePosition(rank: Int = 0, file: Int = 0) -> Position? {
    return Position(rankIndex: rankIndex+rank, fileIndex: fileIndex+file)
  }

  func forward(player: Player) -> Position? {
    switch player {
    case .black:
      return relativePosition(rank: +1)
    case .white:
      return relativePosition(rank: -1)
    }
  }

  func nearestOrderedPositions(_ direction: Direction) -> [Position] {
    var positions = [Position]()
    switch direction {
    case .northWest:
      for index in stride(from: 1, through: rankIndex, by: 1) {
        guard let position = relativePosition(rank: -index, file: -index) else { break }
        positions.append(position)
      }

    case .northEast:
      for index in stride(from: 1, through: rankIndex, by: 1) {
        guard let position = relativePosition(rank: -index, file: +index) else { break }
        positions.append(position)
      }

    case .southWest:
      for index in stride(from: 1, through: Self.maxRanks-rankIndex, by: 1) {
        guard let position = relativePosition(rank: +index, file: -index) else { break }
        positions.append(position)
      }

    case .southEast:
      for index in stride(from: 1, through: Self.maxRanks-rankIndex, by: 1) {
        guard let position = relativePosition(rank: +index, file: +index) else { break }
        positions.append(position)
      }

    case .north:
      for index in stride(from: 1, through: rankIndex, by: 1) {
        guard let position = relativePosition(rank: -index) else { break }
        positions.append(position)
      }

    case .south:
      for index in stride(from: 1, through: Self.maxRanks-rankIndex, by: 1) {
        guard let position = relativePosition(rank: +index) else { break }
        positions.append(position)
      }

    case .west:
      for index in stride(from: 1, through: fileIndex, by: 1) {
        guard let position = relativePosition(file: -index) else { break }
        positions.append(position)
      }

    case .east:
      for index in stride(from: 1, through: Self.maxFiles-fileIndex, by: 1) {
        guard let position = relativePosition(file: +index) else { break }
        positions.append(position)
      }
    }
    return positions
  }

  func nearestPosition(_ direction: Direction) -> Position? {
    return nearestOrderedPositions(direction).first
  }
}
