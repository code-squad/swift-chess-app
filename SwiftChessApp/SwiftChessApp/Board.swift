//
//  Board.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation

protocol BoardPositionable {
    func availablePositions(from current: Position, on board: [Position: Piece]) -> [Position]
}

final class Board {
    struct Score {
        let black: Int
        let white: Int
    }

    let blackPlayer: Player = BlackPlayer()
    let whitePlater: Player = WhitePlayer()

    private var board: [Position: Piece] = [:]

    func newGame() {
        board.removeAll()
        board = [blackPlayer, whitePlater].reduce([Position: Piece](), { partialResult, player in
            var result = partialResult
            result.merge(player.initialPieces.reduce([Position: Piece]()) { partialResult, pieceType in
                var result = partialResult
                result.merge(pieceType.createOnStartPositions()) { (c, _) in c }
                return result
            }) { (c, _) in c }
            return result
        })
    }

    func display() -> [String] {
        var result: [String] = []
        for rank in Position.Rank.allCases {
            var rankDisplay: String = ""
            for file in Position.File.allCases {
                if let piece = board[.init(x: file, y: rank)] {
                    rankDisplay += piece.symbol
                } else {
                    rankDisplay += "."
                }
            }
            result.append(rankDisplay)
        }
        return result
    }

    @discardableResult
    func move(from: Position, to: Position) -> Bool {
        guard let piece = board.removeValue(forKey: from) else { return false }
        let availablePositions = piece.availablePositions(from: from, on: board)
        var result: Bool = false
        for position in availablePositions {
            if position == to {
                board[to] = piece
                result = true
                break
            }
        }
        return result
    }

    func score() -> Score {
        var black: Int = 0
        var white: Int = 0
        for (_, v) in board {
            if v.color == .black {
                black += v.value
            } else {
                white += v.value
            }
        }
        return Score(black: black, white: white)
    }
}
