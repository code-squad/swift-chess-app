//
//  Piece.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/27.
//

import Foundation

protocol Piece {
  var player: Player { get }
  var symbol: String { get }
  var score: Int { get }
  static func makePiecesWithPosition() -> [PieceWithPosition]
  func availableNextPositions(from position: Position, in pieces: PiecesOnBoard?) -> Set<Position>
}

extension Piece {
  func isSamePlayer(_ piece: Piece) -> Bool {
    return player == piece.player
  }

  func validatePositions(_ positions: [Position?], in pieces: PiecesOnBoard) -> Set<Position> {
    return Set(positions.compactMap { $0 }.filter { position in
      if let piece = pieces[position: position], isSamePlayer(piece) {
        return false
      }
      return true
    })
  }

  func validateNearestOrderedPositionsList(_ nearestOrderedPositionsList: [Position?]..., in pieces: PiecesOnBoard) -> Set<Position> {
    var validPositions = Set<Position>()
    for nearestOrderedPositions in nearestOrderedPositionsList {
      for position in nearestOrderedPositions.compactMap({ $0 }) {
        // 체스말을 처음 발견한 경우
        if let piece = pieces[position: position] {
          // 같은 Player의 체스말이 아니면 해당 체스말은 잡을 수 있으므로 상대 Player의 첫번째 체스말 위치까지는 이동 가능한 Postion으로 반영
          if !isSamePlayer(piece) {
            validPositions.insert(position)
          }
          // 체스말을 넘어서 이동할 수 없으므로 break
          break
        }
        validPositions.insert(position)
      }
    }
    return validPositions
  }
}

struct PieceWithPosition {
  let piece: Piece
  let position: Position
}
