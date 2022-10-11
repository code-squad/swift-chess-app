//
//  Position.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/27.
//

import Foundation

struct Position: Hashable {
  enum File: Int, CaseIterable {
    case A = 0, B, C, D, E, F, G, H
  }

  enum Rank: Int, CaseIterable {
    case R1 = 0, R2, R3, R4, R5, R6, R7, R8
  }

  let file: File
  let rank: Rank

  init(file: File, rank: Rank) {
    self.rank = rank
    self.file = file
  }

  init?(file: File?, rank: Rank?) {
    guard let rank, let file else { return nil }
    self.init(file: file, rank: rank)
  }
}

extension Position {
  func relativePosition(row: Int = 0, column: Int = 0) -> Position? {
    return Position(file: .init(rawValue: self.file.rawValue + column), rank: .init(rawValue: self.rank.rawValue + row))
  }

  func forward(player: Player) -> Position? {
    switch player {
    case .black:
      return relativePosition(row: +1)
    case .white:
      return relativePosition(row: -1)
    }
  }

  func nearestOrderedPositions(_ direction: Direction) -> [Position] {
    var positions = [Position]()
    switch direction {
    case .northWest:
      for index in stride(from: 1, through: rank.rawValue, by: 1) {
        guard let position = relativePosition(row: -index, column: -index) else { break }
        positions.append(position)
      }

    case .northEast:
      for index in stride(from: 1, through: rank.rawValue, by: 1) {
        guard let position = relativePosition(row: -index, column: +index) else { break }
        positions.append(position)
      }

    case .southWest:
      for index in stride(from: 1, through: Rank.allCases.count - rank.rawValue, by: 1) {
        guard let position = relativePosition(row: +index, column: -index) else { break }
        positions.append(position)
      }

    case .southEast:
      for index in stride(from: 1, through: Rank.allCases.count - rank.rawValue, by: 1) {
        guard let position = relativePosition(row: +index, column: +index) else { break }
        positions.append(position)
      }

    case .north:
      for index in stride(from: 1, through: rank.rawValue, by: 1) {
        guard let position = relativePosition(row: -index) else { break }
        positions.append(position)
      }

    case .south:
      for index in stride(from: 1, through: Rank.allCases.count - rank.rawValue, by: 1) {
        guard let position = relativePosition(row: +index) else { break }
        positions.append(position)
      }

    case .west:
      for index in stride(from: 1, through: file.rawValue, by: 1) {
        guard let position = relativePosition(column: -index) else { break }
        positions.append(position)
      }

    case .east:
      for index in stride(from: 1, through: File.allCases.count - file.rawValue, by: 1) {
        guard let position = relativePosition(column: +index) else { break }
        positions.append(position)
      }
    }
    return positions
  }

  func nearestPosition(_ direction: Direction) -> Position? {
    return nearestOrderedPositions(direction).first
  }
}
