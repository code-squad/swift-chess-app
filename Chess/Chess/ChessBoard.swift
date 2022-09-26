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

enum Team {
    case white
    case black
}

class ChessBoard: Board {
    private let ranks: [String: Int] = ["1": 0, "2": 1, "3": 2, "4": 3, "5": 4, "6": 5, "7": 6, "8": 7]
    private let files: [String: Int] = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7]

    private var boards: [[Piece?]]
    var scores: [Team: Int]

    init() {
        boards = .init(
            repeating: .init(
                repeating: nil,
                count: files.count
            ),
            count: ranks.count
        )

        scores = [.white: 8, .black: 8]
        reset()
    }

    func reset() {
        scores = [.white: 8, .black: 8]

        for i in 0..<ranks.count {
            for j in 0..<files.count {
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
        let filesString = files.keys.sorted().reduce("") {
            $0 + $1
        }

        let rankString = ranks.keys.sorted()
            .enumerated()
            .map { index, rank in
                var str = rank
                str += boards[index].reduce("") {
                    $0 + ($1?.emoji ?? ".")
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
        guard let fromPiece = boards[from.rankIndex][from.fileIndex],
              fromPiece.canMove(from: from, to: to)
        else { return false }

        let toPiece = boards[to.rankIndex][to.fileIndex]

        if fromPiece.team != toPiece?.team {
            if let toPieceTeam = toPiece?.team,
               let score = scores[toPieceTeam] {
                scores[toPieceTeam] = score - 1
            }

            boards[to.rankIndex][to.fileIndex] = fromPiece
            boards[from.rankIndex][from.fileIndex] = nil
            return true
        }

        return false
    }

    private func position(_ str: String) -> (Position)? {
        guard str.count == 2,
              let file = str.first,
              let fileIndex = files[String(file)],
              0..<8 ~= fileIndex,
              let rank = str.last,
              let rankIndex = ranks[String(rank)],
              0..<8 ~= rankIndex
        else {
            return nil
        }

        return Position(fileIndex: fileIndex, rankIndex: rankIndex)
    }
}
