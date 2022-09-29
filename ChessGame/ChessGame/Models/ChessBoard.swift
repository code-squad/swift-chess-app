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
        board = createBoard(rank: ChessRules().boardSize.rank, file: ChessRules().boardSize.file)
    }
    
    @discardableResult
    private func createBoard(rank: Int, file: Int) -> [[Piece?]] {
        let rank: [Piece?] = Array(repeating: nil, count: rank)
        let file: [[Piece?]] = Array(repeating: rank, count: file)
        
        return file
    }
    
    func resetPieces() {
        createBoard(rank: ChessRules().boardSize.rank, file: ChessRules().boardSize.file)
        setPawn()
    }
    
    private func setPawn() {
        setPawn(.black)
        setPawn(.white)
    }
    
    private func setPawn(_ color: Chess.PieceColor) {
        switch color {
        case .white:
            for rank in 0 ..< ChessRules().pawnCount {
                board[6][rank] = Pawn(color: .white)
            }
        case .black:
            for rank in 0 ..< ChessRules().pawnCount {
                board[1][rank] = Pawn(color: .black)
            }
        }
    }
    
    func move(_ piece: Piece, to: String) -> Bool {
        delegate?.didMoved(isMoved: true)
        return true
    }
}
