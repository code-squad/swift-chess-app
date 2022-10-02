//
//  Board.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

class Board {
    private let rowCount: Int = 8
    private let colCount: Int = 8
    
    private var board: [[Pieceable?]] = []
    private var order: PieceColor = .black
    
    init() {
        startGame()
    }
    
    var score: Score {
        Score(black: getScore(color: .black),
              white: getScore(color: .white))
    }
    
    func display() -> String {
        var result: String
        result = " ABCDEFGH"
        for i in 0 ..< rowCount {
            result += "\n\(i + 1)"
            for j in 0 ..< colCount {
                result += (board[i][j]?.getSymbol() ?? Symbol.empty).image
            }
        }
        result += "\n ABCDEFGH"
        
        return result
    }
        
    func move(from: String, to: String) -> Bool {
        // 해당 위치로 이동할 수 없는 경우
        guard let from = getLocation(input: from),
              let to = getLocation(input: to) else { return false }
        
        // 현재 위치에 피스가 없는 경우
        guard let selectedPiece = board[from.row][from.col] else { return false }
        
        // 이동하려는 위치와 현재 위치가 같은 경우
        guard from != to else { return false }
        
        // 차례가 아닌 경우
        guard selectedPiece.color == order else { return false }
        
        // 이동하려는 곳에 같은 색 피스가 있는 경우
        if let targetPiece = board[to.row][to.col] {
            guard selectedPiece.color != targetPiece.color else { return false }
        }
        
        // 선택된 피스의 이동 규칙이 잘못된 경우
        guard selectedPiece.isMovable(from: from, to: to) else { return false }
        
        
        board[to.row][to.col] = board[from.row][from.col]
        board[from.row][from.col] = nil
        
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
            .reduce(0) { $0 + type(of: $1).score }
    }
    
    func startGame() {
        let row = [Pieceable?](repeating: nil, count: colCount)
        board = [[Pieceable?]](repeating: row, count: rowCount)
        
        putPawns()
        putBishops()
        putRooks()
        putQueens()
        putKnights()
    }
    
    func putPieces(piece: Pieceable, input locations: String...) {
        locations.forEach {
            guard let location = getLocation(input: $0) else { return }
            
            let row = location.row
            let col = location.col
            
            guard row >= 0 && row < rowCount else { return }
            guard col >= 0 && col < colCount else { return }
            guard board[row][col] == nil else { return }
            
            let count = pieces
                .filter { $0.getSymbol().image == piece.getSymbol().image }
                .count
            
            guard count < type(of: piece).maxCount else { return }
            
            board[row][col] = piece
        }
    }
    
    func getLocation(input: String) -> Location? {
        guard let position = Position(input: input) else { return nil }
        guard let location = position.getLocation() else { return nil }
        
        guard location.row >= 0 && location.row < rowCount else { return nil }
        guard location.col >= 0 && location.col < colCount else { return nil }
        
        return location
    }
    
    func putPawns() {
        putPieces(piece: Pawn(color: .black),
                  input: "A2", "B2", "C2", "D2", "E2", "F2", "G2", "H2")
        
        putPieces(piece: Pawn(color: .white),
                  input: "A7", "B7", "C7", "D7", "E7", "F7", "G7", "H7")
    }
    
    func putBishops() {
        putPieces(piece: Bishop(color: .black),
                  input: "C1", "F1")
        
        putPieces(piece: Bishop(color: .white),
                  input: "C8", "F8")
    }
    
    func putRooks() {
        putPieces(piece: Rook(color: .black),
                  input: "A1", "H1")
        
        putPieces(piece: Rook(color: .white),
                  input: "A8", "H8")
    }
    
    func putQueens() {
        putPieces(piece: Queen(color: .black),
                  input: "E1")
        
        putPieces(piece: Queen(color: .white),
                  input: "E8")
    }
    
    func putKnights() {
        putPieces(piece: Knight(color: .black),
                  input: "B1", "G1")
        
        putPieces(piece: Knight(color: .white),
                  input: "B8", "G8")
    }
}
