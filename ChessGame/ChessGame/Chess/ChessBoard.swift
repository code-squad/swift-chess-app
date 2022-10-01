//
//  ChessBoard.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/25.
//

import Foundation

struct ChessBoard: Equatable {
    
    private(set) var data: [[ChessPieceProtocol?]]
    
    init(files: Int, ranks: Int) {
        let fileRow = [ChessPieceProtocol?](repeating: nil, count: files)
        data = Array(repeating: fileRow, count: ranks)
    }
    
    static func ==(lhs: ChessBoard, rhs: ChessBoard) -> Bool {
        guard lhs.allPositions == rhs.allPositions else { return false }
        for position in lhs.allPositions {
            let lPiece = lhs[position]
            let rPiece = rhs[position]
            guard
                type(of: lPiece) == type(of: rPiece),
                lPiece?.teamColor == rPiece?.teamColor
            else { return false }
        }
        return true
    }
    
    subscript(_ position: Position) -> ChessPieceProtocol? {
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
    var allPieces: [ChessPieceProtocol] {
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
            type(of: originPiece).canMove(from: origin, to: destination, board: self)
        else { return false }
        
        self[destination] = self[origin]
        self[origin] = nil
        
        return true
    }
    
    func scoreSum() -> (white: Int, black: Int) {
        var whiteScore = 0
        var blackScore = 0
        for piece in allPieces {
            switch piece.teamColor {
            case .white:
                whiteScore += type(of: piece).score
            case .black:
                blackScore += type(of: piece).score
            }
        }
        return (whiteScore, blackScore)
    }
}

extension ChessBoard {
    static func standardChessBoard() -> ChessBoard {
        var board = ChessBoard(files: 8, ranks: 8)
        // 폰 추가
        for file in 0..<8 {
            board[Position(file: file, rank: 1)] = PawnPiece(teamColor: .white)
            board[Position(file: file, rank: 6)] = PawnPiece(teamColor: .black)
        }
        return board
    }
}
