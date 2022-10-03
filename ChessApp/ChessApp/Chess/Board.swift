//
//  Board.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

final class Board {
    private struct Constants {
        static let maxPawnCount: Int = 8 // pawn의 최대 갯수
//        static let blackPawnInitPosition: Int = Position.Rank.Two.rawValue // 검은말 초기 위치
//        static let whitePawnInitPosition: Int = Position.Rank.Seven.rawValue // 흰말 초기 위치
    }
    
    private var board: [[Piece?]] = []
    
    init() {
        board = [[Piece?]](repeating: [Piece?](repeating: nil, count: Position.File.allCases.count), count: Position.Rank.allCases.count)
    }
    
    func startGame() {
        initBoard(with: Pawn(color: .black), position: Pawn(color: .black).startPosition())
        initBoard(with: Pawn(color: .white), position: Pawn(color: .white).startPosition())
        
        print(displayBoard())

    }
    
    func move(pawn: Piece, from: Position, to: Position) {
//        guard checkEnableToMove(pawn: pawn, from: from, to: to) else { return }
//        board[from.rank.rawValue][from.file.rawValue] = nil
//        board[to.rank.rawValue][to.file.rawValue] = pawn
    }
    
    // 움직일 pawn의 현재 위치와 목표 위치를 받아온다
    // 현재 위치와 목표 위치가 각 pawn의 움직일 수 있는 조건에 맞는지 확인한다
    func checkEnableToMove(piece: Piece, from: Position, to: Position) -> Bool {
        return pieceAvailableCurrent(of: piece, position: from)
        && piece.validToMovePosition(current: from, to: to)
        && pieceAvailableMove(of: piece, position: to)
    }

    // 현재 위치에 해당 색상의 pawn이 있는지 확인
    func pieceAvailableCurrent(of piece: Piece, position: Position) -> Bool {
        guard let currentPawn = board[position.rank.rawValue][position.file.rawValue] else { return false }
        return type(of: currentPawn) == type(of: piece)
    }

    // 목표 위치에 같은 색상 의 pawn이 있는지 확인한다
    func pieceAvailableMove(of piece: Piece, position: Position) -> Bool {
        guard let toPiece = board[position.rank.rawValue][position.file.rawValue]
        else {
            return true
        }
        return type(of: toPiece) != type(of: piece)
    }
}

extension Board {
    func initBoard(with piece: Piece, position: [Position]) {
        position.forEach {
            board[$0.rank.rawValue][$0.file.rawValue] = piece
        }
    }
    
    // 현재 플레이중인 체스보드 표시
    func displayBoard() -> String{
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
