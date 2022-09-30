//
//  Board.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

class Board {
    
    private let rankCount: Int = 8          // row: 1, 2, ..., 8
    private let fileCount: Int = 8          // column: A, B, ..., H
    
    var board: [[Pieceable?]] = []
    var order: PieceColor = .black
    
    init() {
        startGame()
    }
    
    var score: Score {
        return Score(black: getScore(color: .black),
                     white: getScore(color: .white))
    }
    
    func display() -> String {
        var result: String
        result = " ABCDEFGH\n"
        for i in 0 ..< rankCount {
            result += "\(i + 1)"
            for j in 0 ..< fileCount {
                if let piece = board[i][j] {
                    result += piece.getSymbol().image
                } else {
                    result += Symbol.empty.image
                }
            }
            result += "\n"
        }
        result += " ABCDEFGH"
        
        return result
    }
    
    func startGame() {
        let rank = [Pieceable?](repeating: nil, count: fileCount)
        board = [[Pieceable?]](repeating: rank, count: rankCount)
        
        putPawns()
    }
    
    func move(from: String, to: String) -> Bool {
        guard let from = validate(location: from),
              let to = validate(location: to) else { return false }
        guard let selectedPiece = board[from.rank][from.file] else { return false }
        guard selectedPiece.color == order else { return false }
        
        // TODO: 추후에 Piece가 추가된다면 따로 빼야겠다
        switch selectedPiece.getSymbol() {
        case .pawn(.black):
            guard from.rank - to.rank == -1 else { return false }
        case .pawn(.white):
            guard from.rank - to.rank == 1 else { return false }
        case .bishop(.black):
            return true
        case .bishop(.white):
            return true
        case .empty: return false
        }
        
        board[to.rank][to.file] = board[from.rank][from.file]
        board[from.rank][from.file] = nil
        
        order = order == .black ? .white : .black
        return true
    }
}

private extension Board {
    var pieces: [Pieceable] {
        board
            .flatMap { $0 }
            .compactMap { $0 }
    }
    
    func getScore(color: PieceColor) -> Int {
        pieces
            .filter { $0.color == color}
            .count
    }
    
    func putPiece(piece: Pieceable, rank: Int, file: Int) {
        guard rank >= 0 && rank < fileCount else { return }
        guard file >= 0 && file < fileCount else { return }
        guard board[rank][file] == nil else { return }
        
        let count = pieces
            .filter { $0.getSymbol().image == piece.getSymbol().image }
            .count
        
        guard count < type(of: piece).maxCount else { return }
        
        
        board[rank][file] = piece
    }
    
    func validate(location: String) -> Location? {
        guard location.count == 2 else { return nil }
        
        var rank = Int(location.unicodeScalars.last!.value)
        rank -= Int(UnicodeScalar("0").value)
        rank -= 1
        var file = Int(location.unicodeScalars.first!.value)
        file -= Int(UnicodeScalar("A").value)
        
        
        guard rank >= 0 && rank < fileCount else { return nil }
        guard file >= 0 && file < fileCount else { return nil }
        
        return Location(rank: rank, file: file)
    }
    
    func putPawns() {
        for i in 0 ..< fileCount {
            putPiece(piece: Pawn(color: .black), rank: 1, file: i)
        }
        
        for i in 0 ..< fileCount {
            putPiece(piece: Pawn(color: .white), rank: 6, file: i)
        }
    }
}
