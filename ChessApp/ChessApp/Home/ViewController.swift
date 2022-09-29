//
//  ViewController.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/27.
//

import UIKit

enum Pawn {
    case black
    case white
    
    var initPosition: Int {
        switch self {
        case .black: return 1
        case .white: return 6
        }
    }
    
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
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

final class Board {
    private struct Constants {
        static let rankCount: Int = 8 // 가로
        static let fileCount: Int = 8 // 세로
        static let maxPawnCount: Int = 8 // pawn의 최대 갯수
    }
    
    var board: [[Pawn?]] = []
    
    // 체스판을 생성한다
    init() {
        board = [[Pawn?]](repeating: [Pawn?](repeating: nil, count: Constants.rankCount), count: Constants.fileCount)
    }
    
    // 체스보드 초기화 및 체스 말 생성
    func startGame() {
        print("체스 보드를 초기화 했습니다.\n")
        for i in (0...Constants.rankCount) {
            guard i < Constants.maxPawnCount else { return }
            board[Pawn.black.initPosition][i] = Pawn.black
            board[Pawn.white.initPosition][i] = Pawn.white
        }
    }
    
    
    func displayBoard() {
        var display: String = ""
        board.forEach { files in
            let ranks = files.map({ item -> String in
                return item?.display ?? "."
            }).reduce(" ", { $0 + $1 })
            display += ranks
            display += "\n"
        }
        print(display)
    }
}
