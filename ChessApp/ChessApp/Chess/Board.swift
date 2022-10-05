//
//  Board.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

final class Board {
    private var board: [[Piece?]] = []
    
    init() {
        board = [[Piece?]](repeating: [Piece?](repeating: nil, count: Position.File.allCases.count), count: Position.Rank.allCases.count)
    }
    
    func startGame() {
        initBoard(with: Pawn(color: .black))
        initBoard(with: Pawn(color: .white))
        initBoard(with: Bishop(color: .black))
        initBoard(with: Bishop(color: .white))
        initBoard(with: Rook(color: .black))
        initBoard(with: Rook(color: .white))
        initBoard(with: Knight(color: .black))
        initBoard(with: Knight(color: .white))
        initBoard(with: Queen(color: .black))
        initBoard(with: Queen(color: .white))
    }
    
    func move(piece: Piece, from: Position, to: Position) {
        guard checkEnableToMove(piece: piece, from: from, to: to) else { return }
        board[from.rank.rawValue][from.file.rawValue] = nil
        board[to.rank.rawValue][to.file.rawValue] = piece
    }
    
    func checkEnableToMove(piece: Piece, from: Position, to: Position) -> Bool {
        return pieceAvailableCurrent(of: piece, position: from)
        && piece.validToMovePosition(current: from, to: to)
        && pieceAvailableMove(of: piece, position: to)
    }

    func pieceAvailableCurrent(of piece: Piece, position: Position) -> Bool {
        guard let currentPawn = board[position.rank.rawValue][position.file.rawValue] else { return false }
        return type(of: currentPawn) == type(of: piece)
    }

    func pieceAvailableMove(of piece: Piece, position: Position) -> Bool {
        guard let toPiece = board[position.rank.rawValue][position.file.rawValue]
        else {
            return true
        }
        return type(of: toPiece) != type(of: piece)
    }
}

extension Board {
    func initBoard(with piece: Piece) {
        piece.startPosition().forEach({
            board[$0.rank.rawValue][$0.file.rawValue] = piece
        })
    }
    
    func display() -> String {
        var display: String = ""
        display += Position.File.allCases.map {"\($0)"}.reduce(" ", { $0 + $1 })
        display += "\n"
        board
            .enumerated()
            .forEach { index, files in
                let ranks = files.map({ item -> String in
                    return item?.display ?? "."
                }).reduce("", { $0 + $1 })
                display += "\(index + 1)"
                display += ranks
                display += "\n"
            }
        display += Position.File.allCases.map {"\($0)"}.reduce(" ", { $0 + $1 })
        return display
    }
    
    // 현재 각 pawn의 남은 갯수를 알려줌
//    func score() -> String {
//        let avalilablePawn = board
//            .compactMap({ $0.compactMap({ $0 }) })
//            .flatMap({ $0 })
//        let validBlackPawn = avalilablePawn.filter( { $0 == Pawn(color: .black )})
//        let validWhitePawn = avalilablePawn.filter( { $0 == Pawn(color: .white )})
//
//        let score = "현재 스코어\nblack -> \(Constants.maxPawnCount - validWhitePawn.count)\nwhite -> \(Constants.maxPawnCount - validBlackPawn.count)"
//        return score
//    }
}
