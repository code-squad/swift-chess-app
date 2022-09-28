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
        static let blackPawnInitPosition: Int = Rank.Two.rawValue // 검은말 초기 위치
        static let whitePawnInitPosition: Int = Rank.Seven.rawValue // 흰말 초기 위치
    }
    
    private var board: [[Pawn?]] = []
    
    // 체스판을 생성한다
    init() {
        board = [[Pawn?]](repeating: [Pawn?](repeating: nil, count: File.allCases.count), count: Rank.allCases.count)
    }
    
    // 체스보드 초기화 및 체스 말 생성
    func startGame() {
        print("체스 보드를 초기화 했습니다.\n")
        for i in (0..<File.allCases.count) {
            guard i < Constants.maxPawnCount else { return }
            board[Constants.blackPawnInitPosition][i] = Pawn(color: .black)
            board[Constants.whitePawnInitPosition][i] = Pawn(color: .white)
        }
    }
    
    // 움직일 pawn의 현재 위치와 목표 위치를 받아온다
    // 현재 위치와 목표 위치가 각 pawn의 움직일 수 있는 조건에 맞는지 확인한다
    func move(pawn: Pawn, from: Position, to: Position) {
        guard pawnAvailable(of: pawn, position: from),
              pawn.checkEnableToMove(from: from, to: to),
              checkEnableToMove(of: pawn, position: to) else {
            print("cannot move")
            return
        }
        board[from.rank.rawValue][from.file.rawValue] = nil
        board[to.rank.rawValue][to.file.rawValue] = pawn
    }
    
    // 현재 위치에 해당 색상의 pawn이 있는지 확인
    func pawnAvailable(of pawn: Pawn, position: Position) -> Bool {
        guard let currentPawn = board[position.rank.rawValue][position.file.rawValue] else { return false }
        return currentPawn == pawn
    }
    
    // 목표 위치에 같은 색상 의 pawn이 있는지 확인한다
    func checkEnableToMove(of pawn: Pawn, position: Position) -> Bool {
        guard let toPwan = board[position.rank.rawValue][position.file.rawValue]
        else {
            return true
        }
        return toPwan != pawn
    }
}

extension Board {
    
    // 현재 플레이중인 체스보드 표시
    func displayBoard() -> String{
        var display: String = ""
        display += File.allCases.map {"\($0)"}.reduce(" ", { $0 + $1 })
        display += "\n"
        board
            .enumerated()
            .forEach { index, files in
                let ranks = files.map({ item -> String in
                    return item?.color.display ?? "."
                }).reduce("", { $0 + $1 })
                display += "\(index + 1)"
                display += ranks
                display += "\n"
            }
        display += File.allCases.map {"\($0)"}.reduce(" ", { $0 + $1 })
        return display
    }
    
    // 현재 각 pawn의 남은 갯수를 알려줌
    func score() -> String {
        let avalilablePawn = board
            .compactMap({ $0.compactMap({ $0 }) })
            .flatMap({ $0 })
        let validBlackPawn = avalilablePawn.filter( { $0 == Pawn(color: .black )})
        let validWhitePawn = avalilablePawn.filter( { $0 == Pawn(color: .white )})
        
        let score = "현재 스코어\nblack -> \(Constants.maxPawnCount - validWhitePawn.count)\nwhite -> \(Constants.maxPawnCount - validBlackPawn.count)"
        return score
    }
}
