//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

class ChessBoard {
    private var chessPieces: ChessPieces = ChessPieces()
    
    func myPieces(color: ChessPieceColor) -> [ChessPiecable] {
        return chessPieces.all().filter({ $0.color == color })
    }
    
    @discardableResult
    func movePiece(color: ChessPieceColor, from: Position, to: Position) -> Bool {
        guard let piece = chessPieces.find(color: color, position: from) else { return false }
        return chessPieces.move(piece, to: to)
    }
    
    func movablePositions(color: ChessPieceColor, position: Position) -> [Position] {
        guard let piece = chessPieces.find(color: color, position: position) else { return [] }
        return piece.movablePositions()
    }
    
    func checkHitPiece(color: ChessPieceColor, position: Position) -> ChessPiecable? {
        return chessPieces.find(color: color, position: position)
    }
    
    @discardableResult
    func killChessPiece(_ piece: ChessPiecable) -> ChessPiecable? {
        return chessPieces.remove(piece)
    }
}

// MARK: - Piece Maker
extension ChessBoard {
    func createPawns(color: ChessPieceColor, positions: [Position]) {
        positions.forEach {
            self.chessPieces.add(Pawn(color: color, position: $0))
        }
    }
    
    func createBishops(color: ChessPieceColor, positions: [Position]) {
        positions.forEach {
            self.chessPieces.add(Bishop(color: color, position: $0))
        }
    }
    
    func createRooks(color: ChessPieceColor, positions: [Position]) {
        positions.forEach {
            self.chessPieces.add(Rook(color: color, position: $0))
        }
    }
    
    func createQueens(color: ChessPieceColor, positions: [Position]) {
        positions.forEach {
            self.chessPieces.add(Queen(color: color, position: $0))
        }
    }
    
    func createKnights(color: ChessPieceColor, positions: [Position]) {
        positions.forEach {
            self.chessPieces.add(Knight(color: color, position: $0))
        }
    }
}
