//
//  Board.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

@objc protocol BoardDelegate {
    func didMoved(isMoved: Bool)
}

protocol Board {
    var pieces: [Piece] { get set }
    var delegate: BoardDelegate? { get set }
    
    func resetPieces()
    func move(_ piece: Piece, to: String) -> Bool
}

final class ChessBoard: Board {
    var pieces: [Piece] = []
    weak var delegate: BoardDelegate?
    
    func resetPieces() {
        pieces.removeAll()
        setPawn()
    }
    
    private func setPawn() {
        setPawn(.black)
        setPawn(.white)
    }
    
    private func setPawn(_ color: Chess.PieceColor) {
        for _ in 0 ..< ChessRules().pawnCount {
            pieces.append(Pawn(color: color))
        }
    }
    
    func move(_ piece: Piece, to: String) -> Bool {
        delegate?.didMoved(isMoved: true)
        return true
    }
}
