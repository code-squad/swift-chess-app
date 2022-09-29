//
//  ChessBoard.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/29/22.
//

import Foundation

final class ChessBoard: Board {
    var board: [[Piece?]] = [[]]
    weak var delegate: BoardDelegate?
    
    init() {
        board = createBoard(rank: ChessRules.shared.boardSize.rank, file: ChessRules.shared.boardSize.file)
    }
    
    @discardableResult
    private func createBoard(rank: Int, file: Int) -> [[Piece?]] {
        let rank: [Piece?] = Array(repeating: nil, count: rank)
        let file: [[Piece?]] = Array(repeating: rank, count: file)
        
        return file
    }
    
    func resetPieces() {
        createBoard(rank: ChessRules.shared.boardSize.rank, file: ChessRules.shared.boardSize.file)
        setPawn()
    }
    
    private func setPawn() {
        setPawn(.black)
        setPawn(.white)
    }
    
    private func setPawn(_ color: Chess.PieceColor) {
        switch color {
        case .white:
            // TODO: 이후 6, 1 하드 코딩 부분을 손봐야합니다.
            for rank in 0 ..< ChessRules.shared.pawnCount {
                board[6][rank] = Pawn(color: .white)
            }
        case .black:
            for rank in 0 ..< ChessRules.shared.pawnCount {
                board[1][rank] = Pawn(color: .black)
            }
        }
    }
    
    func move(_ piece: Piece, to: String) -> Bool {
        delegate?.didMoved(isMoved: true)
        return true
    }
}
