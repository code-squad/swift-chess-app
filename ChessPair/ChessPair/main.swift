//
//  main.swift
//  ChessPair
//
//  Created by 최동규 on 2022/10/06.
//

import Foundation

struct Position: Hashable {

  let rank: Rank
  let file: File

  init?(rank: Rank?, file: File?) {
    guard let rank = rank,
          let file = file else { return nil }

    self.rank = rank
    self.file = file
  }

  init(rank: Rank, file: File) {
    self.rank = rank
    self.file = file
  }

  enum Rank: Int {
    case r1 = 0, r2, r3, r4, r5, r6, r7, r8
  }

  enum File: Int {
    case a = 0, b, c, d, e, f, g, h
  }
}

protocol King {
  var initialPosition: Position { get }

  func possiblePositions(from position: Position) -> Set<Position>
}

extension King {
  func possiblePositions(from position: Position) -> Set<Position> {
    return Set([Position(rank: .init(rawValue: position.rank.rawValue - 1), file: .init(rawValue: position.file.rawValue - 1)),
                Position(rank: .init(rawValue: position.rank.rawValue - 1), file: .init(rawValue: position.file.rawValue)),
                Position(rank: .init(rawValue: position.rank.rawValue - 1), file: .init(rawValue: position.file.rawValue +  1)),
                Position(rank: .init(rawValue: position.rank.rawValue), file: .init(rawValue: position.file.rawValue - 1)),
                Position(rank: .init(rawValue: position.rank.rawValue), file: .init(rawValue: position.file.rawValue)),
                Position(rank: .init(rawValue: position.rank.rawValue), file: .init(rawValue: position.file.rawValue + 1)),
                Position(rank: .init(rawValue: position.rank.rawValue + 1), file: .init(rawValue: position.file.rawValue - 1)),
                Position(rank: .init(rawValue: position.rank.rawValue + 1), file: .init(rawValue: position.file.rawValue)),
                Position(rank: .init(rawValue: position.rank.rawValue + 1), file: .init(rawValue: position.file.rawValue + 1))]
      .compactMap { $0 })
  }

  func compare(other: King) -> Bool {
    return type(of: self) == type(of: other)
  }
}

final class BlackKing: King {
  let initialPosition: Position = Position(rank: .r1, file: .d)
}

final class WhiteKing: King {
  let initialPosition: Position = Position(rank: .r8, file: .d)
}
