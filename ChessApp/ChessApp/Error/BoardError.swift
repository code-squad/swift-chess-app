//
//  BoardError.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/10.
//

import Foundation

enum BoardError: Error {
  case notMovable
  case notMovableFile
  case notMovableRank
  case emptyBoard
  case invalidFile
  case invalidRank
  
  var localizedDescription: String {
    switch self {
    case .notMovable:
      return "도착가능한 칸이 아닙니다."
    case .notMovableFile:
      return "움직일 수 있는 File칸이 존재하지 않습니다."
    case .notMovableRank:
      return "움직일 수 있는 Rank칸이 존재하지 않습니다."
    case .emptyBoard:
      return "비어있는 칸입니다."
    case .invalidFile:
      return "1~8까지 입력해주세요."
    case .invalidRank:
      return "A~H까지 입력해주세요."
    }
  }
}
