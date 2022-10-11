//
//  Board.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

final class Board {
  
  // MARK: Property
  private let presenter = BoardPresenter()
  private let size: Int = 8
  
  private lazy var coordinator = PositionCoordinator(positionSize: self.size)
  private var score: [Color: Int] = [.black: 0, .white: 0]
  
  // MARK: Initailzer
  init() {
    self.reset()
  }
  
  // MARK: Methods
  func reset() {
    self.coordinator.reset()
  }
  
  func move(to: String, from: String) -> Result<Void, BoardError> {
    do {
      let toPosition = try Position(value: to)
      let fromPosition = try Position(value: from)
      
      let toIndexs = toPosition.toCoordinate()
      let fromIndexs = fromPosition.toCoordinate()
      
      let piece = self.coordinator.getPiece(indexs: toIndexs)
      let result = self.canMove(piece: piece, to: toPosition, from: fromPosition)
      
      if result {
        self.coordinator.setPiece(Empty(), indexs: toIndexs)
        self.coordinator.setPiece(piece, indexs: fromIndexs)
        return .success(Void())
      } else {
        return .failure(.notMovable)
      }
      
    } catch BoardError.invalidRank {
      return .failure(.invalidRank)
    } catch BoardError.invalidFile {
      return .failure(.invalidFile)
    } catch {
      return .failure(.notMovable)
    }
  }
  
  private func canMove(piece: Piece, to: Position, from: Position) -> Bool {
    let movablePositions = piece.movablePositions(from: to)
    
    return movablePositions.contains(from)
  }
  
  func display() -> String {
    return ""
  }
}
