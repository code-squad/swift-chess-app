//
//  King.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

protocol King: Piece {}
extension King {
    func availablePositions(from current: Position, on board: [Position : Piece]) -> [Position] {
        let plusFile = current.x.advanced(by: 1)
        let minusFile = current.x.advanced(by: -1)
        let plusRank = current.y.advanced(by: 1)
        let minusRank = current.y.advanced(by: -1)
        var set = Set<Position>()
        set.insert(.init(x: current.x, y: plusRank))
        set.insert(.init(x: plusFile, y: plusRank))
        set.insert(.init(x: plusFile, y: current.y))
        set.insert(.init(x: plusFile, y: minusRank))
        set.insert(.init(x: current.x, y: minusRank))
        set.insert(.init(x: minusFile, y: minusRank))
        set.insert(.init(x: minusFile, y: current.y))
        set.insert(.init(x: minusFile, y: plusRank))
        return set.map { $0 }
    }
}

struct BlackKing: King {
    private static var startPositions: [Position] {
        [.init(x: .D, y: .one)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = BlackKing()
            return result
        }
    }

    var value: Int { 0 }
    var color: Color { .black }
    var symbol: String { "♚" }
}

struct WhiteKing: King {
    private static var startPositions: [Position] {
        [.init(x: .D, y: .eight)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = WhiteKing()
            return result
        }
    }

    var value: Int { 0 }
    var color: Color { .white }
    var symbol: String { "♔" }
}
