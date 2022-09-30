//
//  Piece.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

protocol Pieceable {
    static var maxCount: Int { get }
    
    var color: PieceColor { get }
    var symbol: String { get }
}

enum PieceColor {
    case black
    case white
}
