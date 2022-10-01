//
//  ChessBoard.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/25.
//

import Foundation

struct ChessBoard {
    
    private(set) var data: [[ChessPiece?]]
    
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
    
    var filesCount: Int {
        data.first?.count ?? 0
    }
    var ranksCount: Int {
        data.count
    }
    var allPieces: [ChessPiece] {
        data.flatMap { $0 }
            .compactMap { $0 }
    }
    var allPositions: [Position] {
        var positions = [Position]()
        for file in 0..<filesCount {
            for rank in 0..<ranksCount {
                positions.append(Position(file: file, rank: rank))
            }
        }
        return positions
    }
    
    func canAccess(position: Position) -> Bool {
        return 0..<filesCount ~= position.file && 0..<ranksCount ~= position.rank
    }
    
    @discardableResult
    mutating func movePiece(from origin: Position, to destination: Position) -> Bool {
        
        guard
            canAccess(position: origin),
            let originPiece = self[origin],
            originPiece.movementValidator.canMove(from: origin, to: destination, board: self)
        else { return false }
        
        self[destination] = self[origin]
        self[origin] = nil
        
        return true
    }
    
    func scoreSum(for teamColor: TeamColor) -> Int {
        var score = 0
        for piece in allPieces {
            if piece.teamColor == teamColor {
                score += piece.type.score
            }
        }
        return score
    }
}

extension ChessBoard {
    static func standardChessBoard() -> ChessBoard {
        var board = ChessBoard(files: 8, ranks: 8)
        // 폰 추가
        for file in 0..<8 {
            board[Position(file: file, rank: 1)] = ChessPiece(type: .pawn, teamColor: .white)
            board[Position(file: file, rank: 6)] = ChessPiece(type: .pawn, teamColor: .black)
        }
        return board
    }
}
