//
//  Pieces.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

class ChessPieces {
    private var pieces: [ChessPiecable] = []
    
    func add(_ piece: ChessPiecable) {
        self.pieces.append(piece)
    }
    
    func find(color: ChessPieceColor, position: Position) -> ChessPiecable? {
        return pieces.first(where: { $0.color == color && $0.position == position })
    }
    
    func all() -> [ChessPiecable] {
        return self.pieces
    }
    
    @discardableResult
    func remove(_ piece: ChessPiecable) -> ChessPiecable? {
        guard let index = self.pieces.firstIndex(where: { $0.color == piece.color && $0.position == piece.position }) else { return nil }
        return self.pieces.remove(at: index)
    }
}
