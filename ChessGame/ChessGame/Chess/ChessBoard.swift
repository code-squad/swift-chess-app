//
//  ChessBoard.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/25.
//

import Foundation

struct ChessBoard {
    
    private var data: [[ChessPiece?]]
    
    init(files: Int, ranks: Int) {
        let fileRow = [ChessPiece?](repeating: nil, count: files)
        data = Array(repeating: fileRow, count: ranks)
    }
    
    subscript(_ position: Position) -> ChessPiece? {
        get {
            data[position.rank][position.file]
        }
        set {
            data[position.rank][position.file] = newValue
        }
    }
    
    var files: Int {
        data.count
    }
    var ranks: Int {
        data.first?.count ?? 0
    }
    
    func canAccess(position: Position) -> Bool {
        return files > position.file && ranks > position.rank
    }
    
    @discardableResult
    mutating func move(from origin: Position, to destination: Position) -> Bool {
        guard
            canAccess(position: origin),
            canAccess(position: destination),
            let originPiece = self[origin]
        else { return false }
        
        guard originPiece.availableMovements(at: origin)
            .contains(destination) else { return false }
        
        if let targetPiece = self[destination] {
            guard targetPiece.teamColor != originPiece.teamColor else { return false }
        }
        
        self[origin] = nil
        self[destination] = originPiece
        
        return true
    }
}

extension ChessBoard {
    static let defaultChessBoard = {
        var board = ChessBoard(files: 8, ranks: 8)
        // 폰 추가
        for rank in 0..<8 {
            board[Position(file: 1, rank: rank)] = ChessPiece(type: .pawn, teamColor: .white)
            board[Position(file: 6, rank: rank)] = ChessPiece(type: .pawn, teamColor: .black)
        }
        return board
    }()
}
