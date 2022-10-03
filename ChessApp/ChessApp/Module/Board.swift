//
//  Board.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

final class Board {
  
  // MARK: Property
  private let boardPosition: Position
  private let size: Int
  private var piecePosition: [[Piece?]] = [[]]
  private var score: [Color: Int] = [.black: 0, .white: 0]
  
  // MARK: Initailzer
  init(size: Int) {
    self.size = size
    self.boardPosition = Position(file: File(), rank: Rank())
    
    self.reset()
  }
  
  // MARK: Methods
  func reset() {
    self.piecePosition = [[Piece?]](
      repeating: [Piece?](repeating: nil, count: self.size),
      count: size
    )
  }
  
  func display() -> String {
    let file = self.boardPosition.file
    let rank = self.boardPosition.rank
    
    let fileLineString = " " + file.position.joined(separator: "")
    
    var rankLineString = ""
    rank.position.enumerated().forEach {
      let index = $0.offset
      let rank = $0.element
      
      rankLineString += rank + self.piecePosition[index]
                               .reduce("") { $0 + ($1?.shape ?? ".")}
      rankLineString += "\n"
    }
    
    return fileLineString + "\n" + rankLineString + fileLineString
  }
  
  func displayScore() -> String {
    let blackScore = self.score[.black] ?? 0
    let whiteScore = self.score[.white] ?? 0
    
    return "흑: \(blackScore) 백: \(whiteScore)"
  }
  
//  func configureScore() {
//    let blackScore = self.position.flatMap { $0 }.filter { $0?.color == .black }
//      .reduce(0) { $0 + ($1?.value ?? 0 )}
//
//    let whiteScore = self.position.flatMap { $0 }.filter { $0?.color == .white }
//      .reduce(0) { $0 + ($1?.value ?? 0 )}
//
//    self.score = [.black: blackScore, .white: whiteScore]
//  }
  
  func movePiece(from: String, to: String) -> Bool {
    guard self.checkMoveValidate(position: from) && self.checkMoveValidate(position: to)
    else {
      return false
    }
    
    return true
  }
  
  private func checkMoveValidate(position: String) -> Bool {
    guard position.count == 2 else { return false }
    
    let split = position.map { String($0) }
    
    let file = split.first ?? ""
    let rank = split.last ?? ""
    
    return self.file.contains(file) && self.rank.contains(rank)
  }
  
  func position(from position: String) -> Position? {
    let split = position.map { String($0) }
    
    guard let file = split.first,
          let rank = split.last,
          let fileIndex = self.file.firstIndex(of: file),
          let rankIndex = self.rank.firstIndex(of: rank)
    else {
      return nil
    }
    
    return Position(file: rankIndex, rank: fileIndex)
  }
}
