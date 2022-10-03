//
//  Piece.swift
//  ChessApp
//
//  Created by MK-AM16-010 on 2022/09/28.
//

import Foundation

protocol Piece {
  var shape: String { get }
  var color: Color { get set }
  var value: Int { get }
  var maxCount: Int { get }
  var movableRankIndex: Int { get }
  
  func movablePositions(from: Position) -> [Position]
}
