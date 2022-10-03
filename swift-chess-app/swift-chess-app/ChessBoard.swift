//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by 이재은(Lee, Jaeeun) on 2022/09/27.
//

import Foundation

// MARK: - ChessBoardProtocol
protocol ChessBoardProtocol: AnyObject {
    var row: Int { get }
    var column: Int { get }

    /// 체스판 만들기
    func makeBoard()

    /// 체스말 이동
    func move(from chessPiece: String,
              to position: String) -> Bool

    /// 보드 위 체스말 출력
    func display() -> [[String]] 

    /// 점수 출력
    func getScore(in board: [[String]]) -> (Int, Int)
}

// MARK: - ChessBoard 체스판
final class ChessBoard: ChessBoardProtocol {

    // MARK: - Properties
    let row: Int
    let column: Int

    // MARK: - Initialize
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }

    var boardState: [[String]] = [[""]]


    // MARK: - Function
    func makeBoard() {
        var board = [[String]](repeatElement([String](repeating: ".", count: column + 1),
                                             count: row + 2))
        board[0] = ["A", "B", "C", "D", "E", "F", "G"]
        board[8] = board[0]

        for i in 1...row {
            board[i][0] = "\(i)"
        }

        for i in 1...column {
            board[2][i] = "♙"
            board[7][i] = "♟"
        }
        self.boardState = board
    }


    func move(from chessPiece: String,
              to position: String) -> Bool {
        // to가 from의 이동가능한 위치인지 확인
        //  -> 아니면 false return
        // 같은 색깔의 말 없는지 확인
        //  -> 아니면 false return
        // 해당 위치에 보드 변경

        return true
    }

    func display() -> [[String]] {
        boardState
    }

    func getScore(in board: [[String]]) -> (Int, Int) {
        let bo = board.flatMap { $0 }
        let whiteScore = bo.filter { $0 == "♙" }.count
        let blackScore = bo.filter { $0 == "♟" }.count
        return (whiteScore, blackScore)
    }
}

// MARK: - BoardPosition 보드칸 위치
struct BoardPosition {
    // String -> (rank, file)
    // (rank, file) -> String

    // String 값을 array array 위치 값으로 변환
    let rank: Character
    let file: Character

    init(_ positionText: String) {
        let pText = Array(positionText)
        self.rank = pText[1]
        self.file = pText[0]
    }

    let fileOrder: [Character: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
    var coordinate: [String: Int] {
        ["rank": 0, "file": fileOrder[file]!]
    }
}
