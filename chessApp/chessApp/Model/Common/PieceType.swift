//
//  PieceType.swift
//  chessApp
//
//  Created by MK-AM16-005 on 2022/09/27.
//

import Foundation

enum PieceType {
  case pawn
  case knight
  case bishop
  case rook
  case queen
  case king
  
  var point: Int {
    switch self {
    case .pawn:
      return 1
    case .knight:
      return 2
    case .bishop:
      return 3
    case .rook:
      return 4
    case .queen:
      return 5
    case .king:
      return 6
    }
  }
  
  var maxCount: Int {
    switch self {
    case .pawn:
      return 8
    case .knight:
      return 2
    case .bishop:
      return 2
    case .rook:
      return 2
    case .queen:
      return 1
    case .king:
      return 1
    }
  }
}
