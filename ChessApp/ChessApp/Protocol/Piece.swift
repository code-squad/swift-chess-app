//
//  Piece.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

protocol Piece {
  var shape: String { get set }
  var color: Color { get set }
  var value: Int { get set }
  
  func movablePositions(from: String) -> [String]
}
