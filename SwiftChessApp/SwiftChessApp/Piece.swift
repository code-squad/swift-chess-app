//
//  Piece.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation

typealias Distance = (dx: Int, dy: Int)

enum Color {
    case white
    case black
}

protocol Piece: BoardPositionable {
    var color: Color { get }
    var image: String { get }
    var value: Int { get }
}


struct Pawn: Piece {
    let color: Color
    var value: Int { 1 }
    var image: String {
        switch color {
        case .black: return "♟"
        case .white: return "♙"
        }
    }

    func availablePositions(from current: Board.Position, on board: [Board.Position:Piece]) -> [Board.Position] {
        let y = current.y.coordinate
        var targets: [Board.Position] = []
        var newRank: Board.Rank? = nil
        switch color {
        case .white:
            newRank = Board.Rank(coordinate: y - 1)
        case .black:
            newRank = Board.Rank(coordinate: y + 1)
        }
        guard let newRank = newRank else { return targets }
        targets.append(.init(x: current.x, y: newRank))
        return targets
    }
}

struct Bishop: Piece {
    let color: Color
    var value: Int { 3 }
    var image: String {
        switch color {
        case .black: return "♝"
        case .white: return "♗"
        }
    }

    func availablePositions(from current: Board.Position, on board: [Board.Position: Piece]) -> [Board.Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Board.Position] = []
        targets.append(contentsOf: xLoop(from: x, through: Board.File.maxCoordinate, by: 1, y: y, board: board))
        targets.append(contentsOf: xLoop(from: x, through: Board.File.minCoordinate, by: -1, y: y, board: board))
        return targets
    }

    private func xLoop(from: Int, through: Int, by: Int, y: Int, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        var plusGapAvailable: Bool = true
        var minusGapAvailable: Bool = true
        for _x in stride(from: from, through: through, by: by) {
            guard _x != from else { continue }
            guard let newFile = Board.File(coordinate: _x) else { break }
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

    private func addTarget(file: Board.File, yCoordinate: Int, board: [Board.Position: Piece], targets: inout [Board.Position]) -> Bool {
        guard let position = availablePosition(file: file, yCoordinate: yCoordinate, board: board) else { return false }
        targets.append(position)
        return board[position] == nil
    }

    private func availablePosition(file: Board.File, yCoordinate: Int, board: [Board.Position: Piece]) -> Board.Position? {
        guard let rank = Board.Rank(coordinate: yCoordinate) else { return nil }
        let position = Board.Position(x: file, y: rank)
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

struct Knight: Piece {
    let color: Color
    var value: Int { 3 }
    var image: String {
        switch color {
        case .black: return "♞"
        case .white: return "♘"
        }
    }

    func availablePositions(from current: Board.Position, on board: [Board.Position: Piece]) -> [Board.Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Board.Position] = []
        targets.append(contentsOf: filebasePositions(x: x, direction: 1, rank: current.y, board: board))
        targets.append(contentsOf: filebasePositions(x: x, direction: -1, rank: current.y, board: board))
        targets.append(contentsOf: rankbasePositions(y: y, direction: 1, file: current.x, board: board))
        targets.append(contentsOf: rankbasePositions(y: y, direction: -1, file: current.x, board: board))
        return targets
    }

    private func filebasePositions(x: Int, direction: Int, rank: Board.Rank, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        guard let file = Board.File(coordinate: x + direction) else { return targets }
        let position = Board.Position(x: file, y: rank)
        guard
            board[position] == nil,
            let newFile = Board.File(coordinate: file.coordinate + direction)
        else { return targets }
        if let newPosition = getPosition(file: newFile, yCoordinate: rank.coordinate + 1, board: board) {
            targets.append(newPosition)
        }
        if let newPosition = getPosition(file: newFile, yCoordinate: rank.coordinate - 1, board: board) {
            targets.append(newPosition)
        }
        return targets
    }

    private func getPosition(file: Board.File, yCoordinate: Int, board: [Board.Position: Piece]) -> Board.Position? {
        guard let rank = Board.Rank(coordinate: yCoordinate) else { return nil }
        let position = Board.Position(x: file, y: rank)
        if let piece = board[position], piece.color == color {
            return nil
        } else {
            return position
        }
    }

    private func rankbasePositions(y: Int, direction: Int, file: Board.File, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        guard let rank = Board.Rank(coordinate: y + direction) else { return targets }
        let position = Board.Position(x: file, y: rank)
        guard
            board[position] == nil,
            let newRank = Board.Rank(coordinate: rank.coordinate + direction)
        else { return targets }
        if let newPosition = getPosition(rank: newRank, xCoordinate: file.coordinate + 1, board: board) {
            targets.append(newPosition)
        }
        if let newPosition = getPosition(rank: newRank, xCoordinate: file.coordinate - 1, board: board) {
            targets.append(newPosition)
        }
        return targets
    }

    private func getPosition(rank: Board.Rank, xCoordinate: Int, board: [Board.Position: Piece]) -> Board.Position? {
        guard let file = Board.File(coordinate: xCoordinate) else { return nil }
        let position = Board.Position(x: file, y: rank)
        if let piece = board[position], piece.color == color {
            return nil
        } else {
            return position
        }
    }
}

struct Rook: Piece {
    let color: Color
    var value: Int { 5 }
    var image: String {
        switch color {
        case .black: return "♜"
        case .white: return "♖"
        }
    }

    func availablePositions(from current: Board.Position, on board: [Board.Position: Piece]) -> [Board.Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Board.Position] = []
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Board.File.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Board.File.minCoordinate, by: -1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Board.Rank.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Board.Rank.minCoordinate, by: -1, board: board))
        return targets
    }

    private func rankbasePositions(rank: Board.Rank, from: Int, throgh: Int, by: Int, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        for x in stride(from: from, through: throgh, by: by) {
            guard x != from else { continue }
            guard let file = Board.File(coordinate: x) else { break }
            let position = Board.Position(x: file, y: rank)
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

    private func filebasePositions(file: Board.File, from: Int, throgh: Int, by: Int, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        for y in stride(from: from, through: throgh, by: by) {
            guard y != from else { continue }
            guard let rank = Board.Rank(coordinate: y) else { break }
            let position = Board.Position(x: file, y: rank)
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

struct Queen: Piece {
    let color: Color
    var value: Int { 9 }
    var image: String {
        switch color {
        case .black: return "♛"
        case .white: return "♕"
        }
    }

    func availablePositions(from current: Board.Position, on board: [Board.Position: Piece]) -> [Board.Position] {
        let x = current.x.coordinate
        let y = current.y.coordinate
        var targets: [Board.Position] = []
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Board.File.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: rankbasePositions(rank: current.y, from: x, throgh: Board.File.minCoordinate, by: -1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Board.Rank.maxCoordinate, by: 1, board: board))
        targets.append(contentsOf: filebasePositions(file: current.x, from: y, throgh: Board.Rank.minCoordinate, by: -1, board: board))
        targets.append(contentsOf: xLoop(from: x, through: Board.File.maxCoordinate, by: 1, y: y, board: board))
        targets.append(contentsOf: xLoop(from: x, through: Board.File.minCoordinate, by: -1, y: y, board: board))
        return targets
    }

    private func rankbasePositions(rank: Board.Rank, from: Int, throgh: Int, by: Int, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        for x in stride(from: from, through: throgh, by: by) {
            guard x != from else { continue }
            guard let file = Board.File(coordinate: x) else { break }
            let position = Board.Position(x: file, y: rank)
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

    private func filebasePositions(file: Board.File, from: Int, throgh: Int, by: Int, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        for y in stride(from: from, through: throgh, by: by) {
            guard y != from else { continue }
            guard let rank = Board.Rank(coordinate: y) else { break }
            let position = Board.Position(x: file, y: rank)
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

    private func xLoop(from: Int, through: Int, by: Int, y: Int, board: [Board.Position: Piece]) -> [Board.Position] {
        var targets: [Board.Position] = []
        var plusGapAvailable: Bool = true
        var minusGapAvailable: Bool = true
        for _x in stride(from: from, through: through, by: by) {
            guard _x != from else { continue }
            guard let newFile = Board.File(coordinate: _x) else { break }
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

    private func addTarget(file: Board.File, yCoordinate: Int, board: [Board.Position: Piece], targets: inout [Board.Position]) -> Bool {
        guard let position = availablePosition(file: file, yCoordinate: yCoordinate, board: board) else { return false }
        targets.append(position)
        return board[position] == nil
    }

    private func availablePosition(file: Board.File, yCoordinate: Int, board: [Board.Position: Piece]) -> Board.Position? {
        guard let rank = Board.Rank(coordinate: yCoordinate) else { return nil }
        let position = Board.Position(x: file, y: rank)
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
