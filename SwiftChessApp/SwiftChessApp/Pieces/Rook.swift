//
//  Rook.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

protocol Rook: Piece {}
extension Rook {
    func availablePositions(from current: Position, on board: [Position: Piece]) -> [Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Position] = []
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Position.File.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Position.File.minCoordinate, by: -1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Position.Rank.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Position.Rank.minCoordinate, by: -1, board: board))
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
}

struct BlackRook: Rook {
    private static var startPositions: [Position] {
        [.init(x: .A, y: .one), .init(x: .H, y: .one)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = BlackRook()
            return result
        }
    }

    var value: Int { 5 }
    var color: Color { .black }
    var symbol: String { "♜" }
}

struct WhiteRook: Rook {
    private static var startPositions: [Position] {
        [.init(x: .A, y: .eight), .init(x: .H, y: .eight)]
    }

    static func createOnStartPositions() -> [Position: Piece] {
        startPositions.reduce([Position: Pawn]()) { partialResult, position in
            var result = partialResult
            result[position] = WhiteRook()
            return result
        }
    }

    var value: Int { 5 }
    var color: Color { .white }
    var symbol: String { "♖" }
}
