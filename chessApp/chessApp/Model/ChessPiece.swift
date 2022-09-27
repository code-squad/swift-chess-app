//
//  ChessPiece.swift
//  chessApp
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import Foundation

class ChessPiece: Equatable {
  
  
  var position: Position
  let color: PieceColor
  let pieceType: PieceType
  
  
  init(position: Position, color: PieceColor, type: PieceType) {
    self.position = position
    self.color = color
    self.pieceType = type
  }
  
  func pieceIcon() -> String {
    switch self.pieceType {
    case .pawn:
      return self.color == .black ? "♟" : "♙"
    case .knight:
      return self.color == .black ? "♞" : "♘"
    case .bishop:
      return self.color == .black ? "♝" : "♗"
    case .rook:
      return self.color == .black ? "♜" : "♖"
    case .queen:
      return self.color == .black ? "♛" : "♕"
    case .king:
      return self.color == .black ? "♚" : "♔"
    }
  }
  
  static func == (lhs: ChessPiece, rhs: ChessPiece) -> Bool {
    return lhs.position == rhs.position
  }
}
