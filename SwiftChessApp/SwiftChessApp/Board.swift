//
//  Board.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation

final class Board {
    typealias Score = (white: Int, black: Int)
    typealias Position = (File, Rank)

    enum Rank: Int {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
    }

    enum File: Int {
        case A, B, C, D, E, F, G, H
    }

    private var whiteScore: Int = 0
    private var blackScore: Int = 0

    // 8x8
    private var board: [[Piece?]]
    init() {
        board = [
//            [Piece(color: .black, type: .rook), Piece(color: .black, type: .knight), Piece(color: .black, type: .bishop), Piece(color: .black, type: .queen), Piece(color: .black, type: .bing), Piece(color: .black, type: .bishop), Piece(color: .black, type: .knight), Piece(color: .black, type: .rook)],
            [nil, nil, nil, nil, nil, nil, nil, nil],
            [Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn), Piece(color: .black, type: .pawn)],
            [nil, nil, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, nil, nil, nil, nil, nil],
            [Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn), Piece(color: .white, type: .pawn)],
//            [Piece(color: .white, type: .rook), Piece(color: .white, type: .knight), Piece(color: .white, type: .bishop), Piece(color: .white, type: .queen), Piece(color: .white, type: .king), Piece(color: .white, type: .bishop), Piece(color: .white, type: .knight), Piece(color: .white, type: .rook)],
            [nil, nil, nil, nil, nil, nil, nil, nil],
        ]
    }

    func score() -> Score {
        (white: whiteScore, black: blackScore)
    }

    func display() -> [String] {
        var result: [String] = []
        for rank in board {
            var rankDisplay: String = ""
            for piece in rank {
                rankDisplay += piece?.image ?? "."
            }
            result.append(rankDisplay)
        }
        return result
    }

    func move(from: Position, to: Position) -> Bool {
        guard let piece = board[from.1.rawValue][from.0.rawValue] else { return false }
        let distances = piece.distances()
        var result: Bool = false
        distances.forEach { (dx, dy) in
            let newFile = from.0.rawValue + dx
            let newRank = from.1.rawValue + dy
            if newFile == to.0.rawValue, newRank == to.1.rawValue {
                if let target = board[newRank][newFile] {
                    let score = target.score
                    if target.color == .white {
                        whiteScore += score
                    } else {
                        blackScore += score
                    }
                    board[newRank][newFile] = piece
                } else {
                    board[newRank][newFile] = piece
                    board[from.1.rawValue][from.0.rawValue] = nil
                }
                result = true
            }
        }
        return result
    }
}
