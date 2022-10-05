//
//  Board.swift
//  ChessGame
//
//  Created by Ador on 2022/09/28.
//

import Foundation

class Board {

    enum File: Int, CaseIterable {
        case A = 0, B, C, D, E, F, G, H
    }

    enum Rank: Int {
        case one = 0, two, three, four, five, six, seven, eight
    }

    private let none = None()
    private var pieces: [[Piece]] = []
    private(set) var turn: Pawn = .white

    func initialize() {
        let count = File.allCases.count
        let blacks: [Pawn] = Array(repeating: .black, count: count)
        let whites: [Pawn] = Array(repeating: .white, count: count)
        let empty: [None] = Array(repeating: none, count: count)

        pieces = [empty,
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
        let pawns = pieces.compactMap { $0 as? [Pawn] }
        pawns.forEach {
            score += $0.filter { $0 == pawn }.count
        }
        return score
    }

    func move(from: (column: File, raw: Rank), to: (column: File, raw: Rank)) -> Bool {
        guard let fromPawn = pieces[from.raw.rawValue][from.column.rawValue] as? Pawn,
              let toPawn = pieces[to.raw.rawValue][to.column.rawValue] as? Pawn else {
                  return false
              }

        if canMove(from: fromPawn, to: toPawn) {
            pieces[to.raw.rawValue][to.column.rawValue] = fromPawn
            pieces[from.raw.rawValue][from.column.rawValue] = none
            turn = toPawn
            return true
        }

        return false
    }

    func display() {
        pieces.forEach {
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
