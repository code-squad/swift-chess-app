//
//  File.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

protocol ChessPiecable: CustomStringConvertible {
    var color: ChessPieceColor { get }
    var position: Position { get set }
    var point: Int { get }
    mutating func move(to position: Position)
    func movablePositions() -> [Position]
}

extension ChessPiecable {
    mutating func move(to position: Position) {
        self.position = position
    }
}

extension ChessPiecable where Self: ChessPieceMovableChecker {
    func movablePositions() -> [Position] {
        self.movablePositions(self.position)
    }
}
