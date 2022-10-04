//
//  Piece.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

protocol Pieceable {
    static var maxCount: Int { get }
    static var score: Int { get }
    
    var color: PieceColor { get }
    
    func isMovable(from: Location, to: Location) -> Bool
    func isBlocked(from: Location, to: Location, board: [[Pieceable?]]) -> Bool
}

extension Pieceable {
    func getSymbol() -> Symbol {
        Symbol(name: String(describing: Self.self).lowercased(),
               color: color)
    }
}
