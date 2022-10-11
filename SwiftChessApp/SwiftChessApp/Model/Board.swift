//
//  Board.swift
//  SwiftChessApp
//
//  Created by Freddy on 2022/09/26.
//

import Foundation

enum BoardError: Error {
  case notPlayersPiece
  case noPiece
}

class Board: ObservableObject {
  @Published private(set) var pieces = PiecesOnBoard()
  @Published private(set) var currentPlayer: Player = .white
  @Published private(set) var selectedPosition: Position? = nil
  @Published private(set) var availableNextPositions: Set<Position> = []

  var scores: [Player: Int] {
    return pieces.scores
  }

  init() {
    setupPieces()
  }

  private func setupPieces() {
    var pieces = PiecesOnBoard()
    pieces.append(piecesOf: Pawn.makePiecesWithPosition())
    pieces.append(piecesOf: Bishop.makePiecesWithPosition())
    pieces.append(piecesOf: Rook.makePiecesWithPosition())
    pieces.append(piecesOf: Queen.makePiecesWithPosition())
    pieces.append(piecesOf: Knight.makePiecesWithPosition())
    pieces.append(piecesOf: King.makePiecesWithPosition())
    self.pieces = pieces
  }

  func selectPiece(at position: Position) -> Result<Void, BoardError> {
    if let selectedPosition {
      movePiece(from: selectedPosition, to: position)
      self.selectedPosition = nil
      self.availableNextPositions = []
      return .success(())
    }

    switch pieces[position: position] {
    case .some(let piece):
      if piece.player == currentPlayer {
        self.selectedPosition = position
        self.availableNextPositions = pieces.availableNextPositions(from: position)
        return .success(())
      }
      return .failure(.notPlayersPiece)
    case .none:
      return .failure(.noPiece)
    }
  }

  private func movePiece(from sourcePosition: Position, to destinationPosition: Position) {
    guard pieces[position: sourcePosition]?.player == currentPlayer,
          pieces.canMovePiece(from: sourcePosition, to: destinationPosition) else { return }
    pieces.movePiece(from: sourcePosition, to: destinationPosition)
    currentPlayer.toggle()
  }

  func restart() {
    pieces = PiecesOnBoard()
    currentPlayer = .white
    selectedPosition = nil
    availableNextPositions = []
    setupPieces()
  }
}
