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
  var point: Int { get }
  
  func movablePositions(from: Position) -> Result<[Position], BoardError>
}
