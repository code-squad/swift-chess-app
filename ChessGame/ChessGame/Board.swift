//
//  Board.swift
//  ChessGame
//
//  Created by Ador on 2022/09/28.
//

import Foundation

class Board {

    enum Pawn: String {
        case black = "♟"
        case white = "♙"
        case none = "."
    }

    enum File: Int, CaseIterable {
        case A = 0, B, C, D, E, F, G, H
    }

    enum Rank: Int {
        case one = 0, two, three, four, five, six, seven, eight
    }

    private var pawns: [[Pawn]] = []
    private(set) var turn: Pawn = .white

    func initialize() {
        let count = File.allCases.count
        let blacks: [Pawn] = Array(repeating: .black, count: count)
        let whites: [Pawn] = Array(repeating: .white, count: count)
        let empty: [Pawn] = Array(repeating: .none, count: count)

        pawns = [empty,
                 blacks,
                 empty,
                 empty,
                 empty,
                 empty,
                 whites,
                 empty]
    }

    func score(with pawn: Pawn) -> Int {
        var score = 0
        pawns.forEach {
            score += $0.filter { $0 == pawn }.count
        }
        return score
    }

    func move(from: (column: File, raw: Rank), to: (column: File, raw: Rank)) -> Bool {
        let fromPawn = pawns[from.raw.rawValue][from.column.rawValue]
        let toPawn = pawns[to.raw.rawValue][to.column.rawValue]

        if canMove(from: fromPawn, to: toPawn) {
            pawns[to.raw.rawValue][to.column.rawValue] = fromPawn
            pawns[from.raw.rawValue][from.column.rawValue] = .none
            turn = toPawn
            return true
        }

        return false
    }

    func display() {
        pawns.forEach {
            let raw = $0.map { pawn in
                pawn.rawValue
            }
            print(raw)
        }
    }

    private func canMove(from: Pawn, to: Pawn) -> Bool {
        // 해당 턴이어야 하고, from과 to가 같지 않아야 함
        guard turn == from, from != to else {
            return false
        }
        return true
    }
}
