//
//  ChessBoard+String.swift
//  chessApp
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import Foundation

extension ChessBoard {
  func description() -> String {
    var strings: [String] = [self.makeFileNumberString(count.boardCount)]
    
    for index in stride(from: 0, through: count.boardCount - 1, by: 1) {
      let rankString = self.numberString(index) + self.makeRankRowString(board[index])
      strings.append(rankString)
    }
    
    strings.append(strings[0])
    strings.append("\n")
    
    return strings.joined(separator: "\n")
  }
  
  private func makeFileNumberString(_ count: Int) -> String {
    let firstWord = UInt8(ascii: "A")
    let lastWord = firstWord+UInt8(count)
    let filesRow = (firstWord ..< lastWord).map { "\(Character(UnicodeScalar($0))) " }
    return "  " + filesRow.reduce("", +)
  }
  
  private func makeRankRowString(_ rankPieces: [ChessPiece?]) -> String {
    let characters: [String] = rankPieces.map { self.pieceString(piece:$0) }
    return characters.reduce("", +)
  }
  
  private func numberString(_ index: Int) -> String {
    return "\(index + 1) "
  }
  
  private func pieceString(piece: ChessPiece?) -> String {
    if let piece = piece {
      return piece.pieceIcon() + " "
    }
    else {
      return ". "
    }
  }
}
