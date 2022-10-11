//
//  Pawn.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

protocol Pawn: Piece { }

struct BlackPawn: Pawn {
    private static var startPositions: [Position] {
        Position.File.allCases.map { Position.init(x: $0, y: .two) }
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = BlackPawn()
            return result
        }
    }

    var value: Int { 1 }
    var color: Color { .black }
    var symbol: String { "♟" }

    func availablePositions(from current: Position, on board: [Position:Piece]) -> [Position] {
        guard current.y != .eight else { return [] }
        let newRank = current.y.advanced(by: 1)
        let newPosition = Position.init(x: current.x, y: newRank)
        var targets: [Position] = []
        if let piece = board[newPosition] {
            if piece.color != color {
                targets.append(newPosition)
            }
        } else {
            targets.append(newPosition)
        }
        return targets
    }
}

struct WhitePawn: Pawn {
    private static var startPositions: [Position] {
        Position.File.allCases.map { Position.init(x: $0, y: .seven) }
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = WhitePawn()
            return result
        }
    }

    var value: Int { 1 }
    var color: Color { .white }
    var symbol: String { "♙" }

    func availablePositions(from current: Position, on board: [Position:Piece]) -> [Position] {
        guard current.y != .one else { return [] }
        let newRank = current.y.advanced(by: -1)
        let newPosition = Position.init(x: current.x, y: newRank)
        var targets: [Position] = []
        if let piece = board[newPosition] {
            if piece.color != color {
                targets.append(newPosition)
            }
        } else {
            targets.append(newPosition)
        }
        return targets
    }
}
