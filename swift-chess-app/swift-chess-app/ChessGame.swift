//
//  ChessGame.swift
//  swift-chess-app
//
//  Created by 이재은(Lee, Jaeeun) on 2022/09/27.
//

import Foundation

// MARK: - ChessGameProtocol
protocol ChessGameProtocol: AnyObject {
    /// 현재 차례인 체스말의 컬러
    var currentOrderColor: ChessPiecesColor { get }

    /// 체스판 초기화. 게임 시작
    func start()

    /// 이동할 체스말과 이동할 위치를 입력받음
    func input()

    /// 번갈아가며 차례대로 게임을 진행함.
    func play(_ currentOrderColor: ChessPiecesColor)
}

// MARK: - ChessGame 체스게임
final class ChessGame: ChessGameProtocol {

    let chessBoard: ChessBoard = ChessBoard(rank: 8, file: 8)
    var currentOrderColor: ChessPiecesColor = .white

    func start() {
        chessBoard.makeBoard()

        print("체스 보드를 초기화했습니다.")

        chessBoard.display()
    }

    func input() {
        var 입력받은from: String = ""
        var 입력받은to: String = ""

        print("명령을 입력하세요>") // 입력 받음

        let successToMove = chessBoard.move(from: 입력받은from, to: 입력받은to)
        if successToMove {
            chessBoard.display()
        }
    }

    func play(_ currentOrderColor: ChessPiecesColor) {
        self.currentOrderColor = currentOrderColor.toggle()
        print("\(currentOrderColor)색 체스말의 차례입니다.")
        input()
    }
}
