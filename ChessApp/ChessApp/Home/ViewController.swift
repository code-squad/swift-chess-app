//
//  ViewController.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/27.
//

import UIKit

enum File: Int, CaseIterable {
    case A = 1
    case B,C,D,E,F,G,H
}

enum Rank: Int, CaseIterable {
    case One = 0
    case Two, Three, Four, Five, Six, Seven, Eight
}

final class Position {
    let file: File
    let rank: Rank

    init(file: File, rank: Rank) {
        self.rank = rank
        self.file = file
    }
}

final class Pawn: Equatable {
    let color: PawnColor
    
    init(color: PawnColor) {
        self.color = color
    }
    
    enum PawnColor {
        case black
        case white
        
        var turn: String {
            switch self {
            case .black: return "흑색 체스말의 차례입니다."
            case .white: return "백색 체스말의 차례입니다."
            }
        }
        
        var display: String {
            switch self {
            case .black: return "♟"
            case .white: return "♙"
            }
        }
    }
    
    func checkEnableToMove(from: Position, to: Position) -> Bool {
        switch color {
        case .black:
            return from.rank.rawValue < to.rank.rawValue
        case .white:
            return from.rank.rawValue > to.rank.rawValue
        }
    }
    
    static func == (lhs: Pawn, rhs: Pawn) -> Bool {
        lhs.color == rhs.color
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

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
    
    // 현재 플레이중인 체스보드 표시
    func displayBoard() {
        var display: String = ""
        board.forEach { files in
            let ranks = files.map({ item -> String in
                return item?.color.display ?? "."
            }).reduce(" ", { $0 + $1 })
            display += ranks
            display += "\n"
        }
        print(display)
    }
    
    // 움직일 pawn의 현재 위치와 목표 위치를 받아온다
    // 현재 위치와 목표 위치가 각 pawn의 움직일 수 있는 조건에 맞는지 확인한다
    // 목표 위치에 같은 색상 의 pawn이 있는지 확인한다
    func move(pawn: Pawn, from: Position, to: Position) {
        guard pawn.checkEnableToMove(from: from, to: to),
              checkEnableToMove(of: pawn, position: to) else {
            print("cannot move")
            return
        }
        board[from.rank.rawValue][from.file.rawValue] = nil
        board[to.rank.rawValue][to.file.rawValue] = pawn
    }
    
    func checkEnableToMove(of pawn: Pawn, position: Position) -> Bool {
        guard let toPwan = board[position.rank.rawValue][position.file.rawValue]
        else {
            return true
        }
        return toPwan != pawn
    }
}
