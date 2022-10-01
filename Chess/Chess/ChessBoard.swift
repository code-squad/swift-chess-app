//
//  ChessBoard.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/09/25.
//

import Foundation

protocol Board {
    func display() -> String
    func move(from: String, to: String) -> Bool
}

class ChessBoard: Board {
    private var boards: [[Piece?]]
    var scores: [Team: Score]
    private let boardSize: Int

    init() {
        boardSize = 8
        boards = .init(
            repeating: .init(
                repeating: nil,
                count: boardSize
            ),
            count: boardSize
        )

        scores = [.white: Score(point: 8), .black: Score(point: 8)]
        reset()
    }

    func reset() {
        scores = [.white: Score(point: 8), .black: Score(point: 8)]

        for i in 0..<boardSize {
            for j in 0..<boardSize {
                if i == 1 {
                    boards[i][j] = Pawn(team: .black)
                } else if i == 6 {
                    boards[i][j] = Pawn(team: .white)
                } else {
                    boards[i][j] = nil
                }
            }
        }
    }

    func display() -> String {
        let filesString = File.allCases.reduce("") {
            $0 + $1.toString
        }

        let rankString = Rank.allCases
            .map { rank in
                var str = rank.toString
                str += boards[rank.index].reduce("") {
                    $0 + ($1?.emoji.rawValue ?? ".")
                }
                return str
            }
            .reduce("") {
                $0 + $1 + "\n"
            }

        return " \(filesString)\n\(rankString) \(filesString)"
    }

    func move(from: String, to: String) -> Bool {
        guard let fromPos = position(from),
              let toPos = position(to)
        else {
            return false
        }

        return move(from: fromPos, to: toPos)
    }

    private func move(from: Position, to: Position) -> Bool {
        guard let fromPiece = boards[from.rank.index][from.file.index],
              fromPiece.canMove(from: from, to: to),
              fromPiece.team != boards[to.rank.index][to.file.index]?.team
        else { return false }

        if let toPiece = boards[to.rank.index][to.file.index],
            let score = scores[toPiece.team] {
            scores[toPiece.team] = score - toPiece.score
        }

        boards[to.rank.index][to.file.index] = fromPiece
        boards[from.rank.index][from.file.index] = nil
        return true
    }

    private func position(_ str: String) -> (Position)? {
        guard str.count == 2,
              let file = File(rawValue: str.first),
              let rank = Rank(str: str.last)
        else {
            return nil
        }

        return Position(file: file, rank: rank)
    }
}
