//
//  ChessBoard.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

struct ChessBoard {
    private var data: [[ChessPiece?]]
    
    // MARK: - Init
    
    init(files: Int, ranks: Int) {
        let fileRow = [ChessPiece?](repeating: nil, count: files)
        data = Array(repeating: fileRow, count: ranks)
    }
    
    // MARK: - Internal
    
    var allRanks: [[ChessPiece?]] { data }
    
    // MARK: - Method
    
    @discardableResult
    mutating func move(from origin: Position, to destination: Position) -> Bool {
        guard
            let piece = piece(at: origin)
        else { return false }
        
        let success = addPiece(piece, at: destination)
        guard success else { return false }
        removePiece(at: origin)
        
        return true
    }
    
    @discardableResult
    func piece(at position: Position) -> ChessPiece? {
        guard canAccess(position: position) else { return nil }
        return self[position]
    }
    
    // MARK: - Private
    
    private func canAccess(position: Position) -> Bool {
        return data.count > position.file && data.first?.count ?? 0 > position.rank
    }
    
    @discardableResult
    private mutating func addPiece(_ piece: ChessPiece, at position: Position) -> Bool {
        guard canAccess(position: position) else { return false }
        self[position] = piece
        return true
    }
    
    @discardableResult
    private mutating func removePiece(at position: Position) -> ChessPiece? {
        guard let piece = piece(at: position) else { return nil }
        self[position] = nil
        return piece
    }
    
    private subscript(_ position: Position) -> ChessPiece? {
        get {
            data[position.rank][position.file]
        }
        set {
            data[position.rank][position.file] = newValue
        }
    }
}

extension ChessBoard {
    static let defaultChessBoard = {
        var board = ChessBoard(files: 8, ranks: 8)
        // 폰 추가
        for rank in 0..<8 {
            board.addPiece(ChessPiece(type: .pawn, teamColor: .white), at: Position(file: 1, rank: rank))
            board.addPiece(ChessPiece(type: .pawn, teamColor: .black), at: Position(file: 6, rank: rank))
        }
        return board
    }()
}
