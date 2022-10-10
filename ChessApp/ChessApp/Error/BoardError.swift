//
//  BoardError.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/10/10.
//

import Foundation

enum BoardError: Error {
  case notMovableFile
  case notMovableRank
  case emptyBoard
  
  var message: String {
    switch self {
    case .notMovableFile:
      return "움직일 수 있는 File칸이 존재하지 않습니다."
    case .notMovableRank:
      return "움직일 수 있는 Rank칸이 존재하지 않습니다."
    case .emptyBoard:
      return "비어있는 칸입니다."
    }
  }
}
