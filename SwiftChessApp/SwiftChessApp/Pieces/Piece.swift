//
//  Piece.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation

typealias Distance = (dx: Int, dy: Int)

protocol SymbolPresentable {
    var symbol: String { get }
}

protocol Piece: BoardPositionable, TeamSelectable, SymbolPresentable {
    static func createOnStartPositions() -> [Position: Piece]
    var value: Int { get }
}
