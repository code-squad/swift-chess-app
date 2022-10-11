//
//  Queen.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

protocol Queen: Piece {}
extension Queen {
    func availablePositions(from current: Position, on board: [Position: Piece]) -> [Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Position] = []
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Position.File.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Position.File.minCoordinate, by: -1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Position.Rank.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Position.Rank.minCoordinate, by: -1, board: board))
        targets.append(contentsOf: xLoop(from: x, through: Position.File.maxCoordinate, by: 1, y: y, board: board))
        targets.append(contentsOf: xLoop(from: x, through: Position.File.minCoordinate, by: -1, y: y, board: board))
        return targets
    }

    private func rankbasePositions(rank: Position.Rank, from: Int, throgh: Int, by: Int, board: [Position: Piece]) -> [Position] {
        var targets: [Position] = []
        for x in stride(from: from, through: throgh, by: by) {
            guard x != from else { continue }
            guard let file = Position.File(rawValue: x) else { break }
            let position = Position(x: file, y: rank)
            if let piece = board[position] {
                if piece.color != color {
                    targets.append(position)
                }
                break
            } else {
                targets.append(position)
            }
        }
        return targets
    }

    private func filebasePositions(file: Position.File, from: Int, throgh: Int, by: Int, board: [Position: Piece]) -> [Position] {
        var targets: [Position] = []
        for y in stride(from: from, through: throgh, by: by) {
            guard y != from else { continue }
            guard let rank = Position.Rank(rawValue: y) else { break }
            let position = Position(x: file, y: rank)
            if let piece = board[position] {
                if piece.color != color {
                    targets.append(position)
                }
                break
            } else {
                targets.append(position)
            }
        }
        return targets
    }

    private func xLoop(from: Int, through: Int, by: Int, y: Int, board: [Position: Piece]) -> [Position] {
        var targets: [Position] = []
        var plusGapAvailable: Bool = true
        var minusGapAvailable: Bool = true
        for _x in stride(from: from, through: through, by: by) {
            guard _x != from else { continue }
            guard let newFile = Position.File(rawValue: _x) else { break }
            let gap = abs(from - newFile.coordinate)
            if plusGapAvailable {
                plusGapAvailable = addTarget(file: newFile, yCoordinate: y + gap, board: board, targets: &targets)
            }
            if minusGapAvailable {
                minusGapAvailable = addTarget(file: newFile, yCoordinate: y - gap, board: board, targets: &targets)
            }
        }
        return targets
    }

    private func addTarget(file: Position.File, yCoordinate: Int, board: [Position: Piece], targets: inout [Position]) -> Bool {
        guard let position = availablePosition(file: file, yCoordinate: yCoordinate, board: board) else { return false }
        targets.append(position)
        return board[position] == nil
    }

    private func availablePosition(file: Position.File, yCoordinate: Int, board: [Position: Piece]) -> Position? {
        guard let rank = Position.Rank(rawValue: yCoordinate) else { return nil }
        let position = Position(x: file, y: rank)
        if let piece = board[position] {
            if piece.color == color {
                return nil
            } else {
                return position
            }
        } else {
            return position
        }
    }
}

struct BlackQueen: Queen {
    private static var startPositions: [Position] {
        [.init(x: .E, y: .one)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = BlackQueen()
            return result
        }
    }

    var value: Int { 9 }
    var color: Color { .black }
    var symbol: String { "♛" }
}

struct WhiteQueen: Queen {
    private static var startPositions: [Position] {
        [.init(x: .E, y: .eight)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = WhiteQueen()
            return result
        }
    }

    var value: Int { 9 }
    var color: Color { .white }
    var symbol: String { "♕" }
}
