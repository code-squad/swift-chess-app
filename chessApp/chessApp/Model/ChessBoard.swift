//
//  ChessBoard.swift
//  chessApp
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import Foundation

enum count {
  static let boardCount = 8
}

final class ChessBoard {

  private(set) var board: [[ChessPiece?]]
  
  init() {
    let rank: [ChessPiece?] = Array(repeating: nil, count: count.boardCount)
    board = Array(repeating: rank, count: count.boardCount)
  }
  
  subscript(_ position: Position) -> ChessPiece? {
    get {
      board[position.rank][position.file]
    }
    set {
      board[position.rank][position.file] = newValue
    }
  }
  
  func isBoardRange(_ position: Position) -> Bool {
    let isBoardRange = (count.boardCount > position.rank && count.boardCount > position.file)
    return isBoardRange
  }
  
  
  func moveToChessPiece(from currentPosition: Position, to nextPosition: Position) -> Bool {
    guard
      isBoardRange(currentPosition),
      isBoardRange(nextPosition),
      let currentPiece = self[currentPosition]
    else { return false }
      
    if let currentPiece = currentPiece  as? ChessPawn {
      guard currentPiece.isPieceRange(nextPosition: nextPosition) else { return false }
    }
    
    if let anotherPiece = self[nextPosition] as? ChessPawn {
      guard anotherPiece.color != currentPiece.color else { return false }
    }
    
    self[currentPosition] = nil
    self[nextPosition] = currentPiece    
    return true
  }
  
  var pieces: [ChessPiece] {
    self.board.flatMap { $0 }.compactMap { $0 }
  }
  
  func aggregationPoint(_ color: PieceColor) -> Int {
    let pawn = pieces.filter{$0.color == color && $0.pieceType == .pawn}
    let count = pawn.count
    return count * PieceType.pawn.point
  }
}

extension ChessBoard {
  static func initializeChessBoard() -> ChessBoard {
    let chessBoard = ChessBoard()
    for file in 0..<PieceType.pawn.maxCount {
      let blackPosition = Position(rank: 1, file: file)
      let whitePosition = Position(rank: 6, file: file)
      chessBoard[whitePosition] = ChessPiece(position: whitePosition, color: .white, type: .pawn)
      chessBoard[blackPosition] = ChessPiece(position: blackPosition, color: .black, type: .pawn)
    }
    
    print(chessBoard.description())
    return chessBoard
  }
}
