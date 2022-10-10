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
        
        guard canMove(from: origin, to: destination) else { return false }
        
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
    
    func canMove(from origin: Position, to destination: Position) -> Bool {
        guard
            origin != destination,
            canAccess(position: origin),
            canAccess(position: destination),
            let originPiece = self[origin],
            originPiece.teamColor != self[destination]?.teamColor,
            originPiece.isDeltaValid(delta: destination - origin)
        else { return false }
        return originPiece.isMovementValid(origin: origin, destination: destination, board: self)
    }
    
    func availableMovingPositions(at position: Position) -> Set<Position> {
        let availablePositions = allPositions
            .filter { canMove(from: position, to: $0) }
        return Set(availablePositions)
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
        
        // 비숍 추가
        board[Position("C1")!] = BishopPiece(teamColor: .white)
        board[Position("F1")!] = BishopPiece(teamColor: .white)
        
        board[Position("C8")!] = BishopPiece(teamColor: .black)
        board[Position("F8")!] = BishopPiece(teamColor: .black)
        
        // 룩 추가
        board[Position("A1")!] = RookPiece(teamColor: .white)
        board[Position("H1")!] = RookPiece(teamColor: .white)
        
        board[Position("A8")!] = RookPiece(teamColor: .black)
        board[Position("H8")!] = RookPiece(teamColor: .black)
        
        // 퀸 추가
        board[Position("D1")!] = QueenPiece(teamColor: .white)
        board[Position("D8")!] = QueenPiece(teamColor: .black)
        
        // 나이트 추가
        board[Position("B1")!] = KnightPiece(teamColor: .white)
        board[Position("G1")!] = KnightPiece(teamColor: .white)
        
        board[Position("B8")!] = KnightPiece(teamColor: .black)
        board[Position("G8")!] = KnightPiece(teamColor: .black)
        
        // 킹 추가
        board[Position("E1")!] = KingPiece(teamColor: .white)
        board[Position("E8")!] = KingPiece(teamColor: .black)
        
        return board
    }
}
