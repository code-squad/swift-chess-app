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

        scores = [:]
        reset()
    }

    func reset() {
        scores = [.white: Score(point: 0), .black: Score(point: 0)]

        for i in 0..<boardSize {
            for j in 0..<boardSize {
                if i == 0 {
                    if j == 0 || j == 7 {
                        let blackRook = Rook(team: .black)
                        boards[i][j] = blackRook
                        scores[.black] = (scores[.black] ?? Score(point: 0)) + blackRook.score
                    } else if j == 1 || j == 6 {
                        let blackKnight = Knight(team: .black)
                        boards[i][j] = blackKnight
                        scores[.black] = (scores[.black] ?? Score(point: 0)) + blackKnight.score
                    } else if j == 2 || j == 5 {
                        let blackBishop = Bishop(team: .black)
                        boards[i][j] = blackBishop
                        scores[.black] = (scores[.black] ?? Score(point: 0)) + blackBishop.score
                    } else if j == 4 {
                        let blackQueen = Queen(team: .black)
                        boards[i][j] = blackQueen
                        scores[.black] = (scores[.black] ?? Score(point: 0)) + blackQueen.score
                    }
                } else if i == 1 {
                    let blackPawn = Pawn(team: .black)
                    boards[i][j] = blackPawn
                    scores[.black] = (scores[.black] ?? Score(point: 0)) + blackPawn.score
                } else if i == 6 {
                    let whitePawn = Pawn(team: .white)
                    boards[i][j] = whitePawn
                    scores[.white] = (scores[.white] ?? Score(point: 0)) + whitePawn.score
                } else if i == 7 {
                    if j == 0 || j == 7 {
                        let whiteRook = Rook(team: .white)
                        boards[i][j] = whiteRook
                        scores[.white] = (scores[.white] ?? Score(point: 0)) + whiteRook.score
                    } else if j == 1 || j == 6 {
                        let whiteKnight = Knight(team: .white)
                        boards[i][j] = whiteKnight
                        scores[.white] = (scores[.white] ?? Score(point: 0)) + whiteKnight.score
                    } else if j == 2 || j == 5 {
                        let whiteBishop = Bishop(team: .white)
                        boards[i][j] = whiteBishop
                        scores[.white] = (scores[.white] ?? Score(point: 0)) + whiteBishop.score
                    } else if j == 4 {
                        let whiteQueen = Queen(team: .white)
                        boards[i][j] = whiteQueen
                        scores[.white] = (scores[.white] ?? Score(point: 0)) + whiteQueen.score
                    }
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
