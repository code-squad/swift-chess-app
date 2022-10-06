//
//  main.swift
//  pair05a
//
//  Created by MK-AM16-010 on 2022/10/06.
//

import Foundation

struct King: Piece {
  let color: Color
  var position: Position
}

enum Color {
  case white
  case black
}

protocol Piece {
  var color: Color { get }
  var position: Position { get set }
}

struct Position {
  let rank: Rank
  let file: File
}

enum Rank: Int {
  case one = 1, two, three, four, five, six, sevent, eight
}

enum File: Int {
  case A = 1, B, C, D, E, F, G, H
}
