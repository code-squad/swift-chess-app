//
//  Knight.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

protocol Knight: Piece {}
extension Knight {
    func availablePositions(from current: Position, on board: [Position: Piece]) -> [Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Position] = []
        targets.append(contentsOf: filebasePositions(x: x, direction: 1, rank: current.y, board: board))
        targets.append(contentsOf: filebasePositions(x: x, direction: -1, rank: current.y, board: board))
        targets.append(contentsOf: rankbasePositions(y: y, direction: 1, file: current.x, board: board))
        targets.append(contentsOf: rankbasePositions(y: y, direction: -1, file: current.x, board: board))
        return targets
    }

    private func filebasePositions(x: Int, direction: Int, rank: Position.Rank, board: [Position: Piece]) -> [Position] {
        var targets: [Position] = []
        guard let file = Position.File(rawValue: x + direction) else { return targets }
        let position = Position(x: file, y: rank)
        guard
            board[position] == nil,
            let newFile = Position.File(rawValue: file.coordinate + direction)
        else { return targets }
        if let newPosition = getPosition(file: newFile, yCoordinate: rank.coordinate + 1, board: board) {
            targets.append(newPosition)
        }
        if let newPosition = getPosition(file: newFile, yCoordinate: rank.coordinate - 1, board: board) {
            targets.append(newPosition)
        }
        return targets
    }

    private func getPosition(file: Position.File, yCoordinate: Int, board: [Position: Piece]) -> Position? {
        guard let rank = Position.Rank(rawValue: yCoordinate) else { return nil }
        let position = Position(x: file, y: rank)
        if let piece = board[position], piece.color == color {
            return nil
        } else {
            return position
        }
    }

    private func rankbasePositions(y: Int, direction: Int, file: Position.File, board: [Position: Piece]) -> [Position] {
        var targets: [Position] = []
        guard let rank = Position.Rank(rawValue: y + direction) else { return targets }
        let position = Position(x: file, y: rank)
        guard
            board[position] == nil,
            let newRank = Position.Rank(rawValue: rank.coordinate + direction)
        else { return targets }
        if let newPosition = getPosition(rank: newRank, xCoordinate: file.coordinate + 1, board: board) {
            targets.append(newPosition)
        }
        if let newPosition = getPosition(rank: newRank, xCoordinate: file.coordinate - 1, board: board) {
            targets.append(newPosition)
        }
        return targets
    }

    private func getPosition(rank: Position.Rank, xCoordinate: Int, board: [Position: Piece]) -> Position? {
        guard let file = Position.File(rawValue: xCoordinate) else { return nil }
        let position = Position(x: file, y: rank)
        if let piece = board[position], piece.color == color {
            return nil
        } else {
            return position
        }
    }
}

struct BlackKnight: Knight {
    private static var startPositions: [Position] {
        [.init(x: .B, y: .one), .init(x: .G, y: .one)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = BlackKnight()
            return result
        }
    }

    var value: Int { 3 }
    var color: Color { .black }
    var symbol: String { "♞" }
}

struct WhiteKnight: Knight {
    private static var startPositions: [Position] {
        [.init(x: .B, y: .eight), .init(x: .G, y: .eight)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = WhiteKnight()
            return result
        }
    }

    var value: Int { 3 }
    var color: Color { .white }
    var symbol: String { "♘" }
}
