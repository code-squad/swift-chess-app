//
//  Board.swift
//  ChessGame
//
//  Created by Ador on 2022/09/28.
//

import Foundation

class Board {

    struct Position: Equatable {

        enum File: Int, CaseIterable {
            case a = 0, b, c, d, e, f, g, h
        }

        enum Rank: Int, CaseIterable {
            case one = 0, two, three, four, five, six, seven, eight
        }

        let rank: Rank
        let file: File
    }

    private(set) var pieces: [Piece] = []
    private(set) var turn: Piece.Color = .white

    func initialize() {

        Piece.Color.allCases.forEach { color in
            // pawn
            Position.File.allCases.forEach {
                let rank: Position.Rank = color == .black ? .two : .seven
                let pawn = Pawn(color: color, position: .init(rank: rank, file: $0))
                pieces.append(pawn)
            }
            // bishop
            let bishopRank: Position.Rank = color == .black ? .one : .eight
            pieces.append(Bishop(color: color, position: .init(rank: bishopRank, file: .c)))
            pieces.append(Bishop(color: color, position: .init(rank: bishopRank, file: .f)))

            // rook
            let rookRank: Position.Rank = color == .black ? .one : .eight
            pieces.append(Rook(color: color, position: .init(rank: rookRank, file: .a)))
            pieces.append(Rook(color: color, position: .init(rank: rookRank, file: .h)))
        }
    }

    func score(with color: Piece.Color) -> Int {
        let scores = pieces.filter { $0.color == color }
            .map { $0 as? Markable }
            .compactMap { $0?.mark }
        return scores.reduce(0, +)
    }

    func move(from: Position, to: Position) -> Bool {
        if canMove(from: piece(for: from), to: piece(for: to)) {
            piece(for: from)?.move(to: to)
            piece(for: to)?.move(to: from)
            return true
        }
        return false
    }

    func display() {
        Position.Rank.allCases.reversed().forEach { rank in
            Position.File.allCases.forEach { file in
                print(piece(for: .init(rank: rank, file: file))?.rawValue ?? ".", terminator: " ")
            }
            print("", terminator: "\n")
        }
    }

    private func canMove(from: Piece?, to: Piece?) -> Bool {
        // 해당 턴이어야 하고
        guard let from = from, turn == from.color else {
            return false
        }
        // from과 to가 같지 않아야 함
        guard let to = to, from.color == to.color else {
            return false
        }
        return true
    }
}

extension Board {

    func piece(for position: Position) -> Piece? {
        return pieces.first { piece in
            piece.position == position
        }
    }
}
