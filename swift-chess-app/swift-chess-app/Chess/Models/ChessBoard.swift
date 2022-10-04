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
        guard var piece = chessPieces.find(color: color, position: from) else { return false }
        piece.move(to: to)
        return true
    }
    
    func movablePositions(color: ChessPieceColor, position: Position) -> [Position] {
        guard let piece = chessPieces.find(color: color, position: position) else { return [] }
        return piece.movablePositions()
    }
    
    func checkHitPiece(color: ChessPieceColor, position: Position) -> ChessPiecable? {
        return chessPieces.find(color: color, position: position)
    }
    
    func killChessPiece(_ piece: ChessPiecable) {
        chessPieces.remove(piece)
    }
}

// MARK: - Display(Presenter)
extension ChessBoard {
    func display() {
        var matrix: [[ChessPiecable?]]
        let rank: [ChessPiecable?] = Array(repeating: nil, count: 8)
        matrix = Array(repeating: rank, count: 8)

        self.chessPieces.all().forEach({ piece in
            matrix[piece.position.rank.rawValue - 1][piece.position.file.rawValue - 1] = piece
        })

        var string = ""
        string += File.allCases.map{ $0.invertedTypeString }.reduce(" ", { $0 + $1 })
        string += "\n"

        Rank.allCases.forEach({ rank in
            string += "\(rank.invertedTypeString)"
            string +=  matrix[rank.rawValue - 1]
                .map({
                    if let piece = $0 { return piece.description }
                    else { return "." }
                })
                .reduce("", { $0 + $1 })
            string += "\n"
        })

        string += File.allCases.map{ $0.invertedTypeString }.reduce(" ", { $0 + $1 })

        print(string)
    }
    
    @discardableResult
    func infoDisplay(color: ChessPieceColor, position: Position) -> Bool {
        guard let piece = chessPieces.find(color: color, position: position) else {
            return false
        }
        
        let string = piece.movablePositions().map({ $0.description })
        print(string)
        return true
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
