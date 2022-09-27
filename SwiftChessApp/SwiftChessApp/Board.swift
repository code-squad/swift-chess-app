//
//  Board.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/26.
//

import Foundation

class Board {
  private(set) var pieces = [[Piece?]]()

  var scores: [Player: Int] {
    let playerPieces = pieces.flatMap { $0 }.compactMap { $0 }
    return playerPieces.reduce(into: [.black: 0, .white: 0]) { counts, piece in
      counts[piece.player, default: 0] += piece.score
    }
  }

  init() {
    setupPieces()
  }

  private func setupPieces() {
    pieces = .init(
      repeating: .init(
        repeating: nil,
        count: Position.maxFiles
      ),
      count: Position.maxRanks
    )

    for fileIndex in (0..<Position.maxFiles) {
      pieces[position: .init(rankIndex: 1, fileIndex: fileIndex)] = Pawn(player: .black)
      pieces[position: .init(rankIndex: 6, fileIndex: fileIndex)] = Pawn(player: .white)
    }
  }

  func move(from sourcePosition: Position?, to destinationPosition: Position?) -> Bool {
    guard let sourcePosition, let destinationPosition, canMove(from: sourcePosition, to: destinationPosition) else { return false }
    pieces[position: destinationPosition] = pieces[position: sourcePosition]
    pieces[position: sourcePosition] = nil
    return true
  }

  private func canMove(from sourcePosition: Position, to destinationPosition: Position) -> Bool {
    guard let sourcePiece = pieces[position: sourcePosition],
          sourcePiece.canMove(from: sourcePosition, to: destinationPosition) else {
      return false
    }

    // 같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다
    if sourcePiece.player == pieces[position: destinationPosition]?.player {
      return false
    }

    return true
  }

  func display() {
    print(" ABCDEFGH")
    for rankIndex in 0..<Position.maxRanks {
        print(rankIndex + 1, terminator: "")
      for fileIndex in 0..<Position.maxFiles {
        print(pieces[position: .init(rankIndex: rankIndex, fileIndex: fileIndex)]?.symbol ?? ".", terminator: "")
      }
      print()
    }
    print(" ABCDEFGH")
  }
}
