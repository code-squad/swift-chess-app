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
    func move(from positionText: String,
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

    var boardState: [[ChessPieceProtocol]] = [[]]


    // MARK: - Function
    func makeBoard() {
        var board = [[ChessPieceProtocol]](repeatElement([ChessPieceProtocol](repeating: EmptySpace(), count: column),
                                             count: row))
        for i in 0..<column {
            board[1][i] = Pawn(color: .black)
            board[6][i] = Pawn(color: .white)

            if i == 0 || i == 7 {
                board[0][i] = Rook(color: .black)
                board[7][i] = Rook(color: .white)
            } else if i == 1 || i == 6 {
                board[0][i] = Knight(color: .black)
                board[7][i] = Knight(color: .white)
            } else if i == 2 || i == 5 {
                board[0][i] = Bishop(color: .black)
                board[7][i] = Bishop(color: .white)
            } else if i == 4 {
                board[0][i] = Queen(color: .black)
                board[7][i] = Queen(color: .white)
            }
        }
        self.boardState = board
    }


    func move(from positionText: String,
              to position: String) -> Bool {
        let fromP = BoardPosition(positionText)
        let chessPiece = boardState[fromP.rank.value][fromP.file.value]
//        let movablePositions = chessPiece.getMovablePositions(in: boardState)

        // to가 from의 이동가능한 위치인지 확인
        //  -> 아니면 false return
        // 같은 색깔의 말 없는지 확인
        //  -> 아니면 false return
        // 해당 위치에 보드 변경

        return true
    }

    func display() -> [[String]] {
        var board = [[String]](repeating: [String](repeating: ".", count: column),
                               count: row)

        for i in 0..<boardState.count {
            for j in 0..<boardState[i].count {
                if boardState[i][j].color == .black {
                    board[i][j] = boardState[i][j].type.blackPiece
                } else if boardState[i][j].color == .white {
                    board[i][j] = boardState[i][j].type.whitePiece
                }
            }
        }
        return board 
    }

    func getScore(in board: [[String]]) -> (Int, Int) {
        let bo = board.flatMap { $0 }
        var whiteScore = 0
        var blackScore = 0

        for i in ChessType.allCases.enumerated() {
            let whitePieceCount = bo.filter { $0 == i.element.whitePiece }.count
            whiteScore += whitePieceCount * i.element.score
            let blackPieceCount = bo.filter { $0 == i.element.blackPiece }.count
            blackScore += blackPieceCount * i.element.score
        }
        return (whiteScore, blackScore)
    }
}
