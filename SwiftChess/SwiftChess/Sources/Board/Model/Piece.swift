//
//  Piece.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

protocol Piece {
    var color: PieceColor { get }
}

enum PieceColor {
    case black
    case white
}
