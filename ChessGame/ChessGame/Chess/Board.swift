//
//  Board.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

struct Board {
    private(set) var data: [[ChessPiece?]] = []
    
    // MARK: - Prepare
    
    init() {
        configureBoard(files: 8, ranks: 8)
        configureInitialChessPiece()
    }
    
    private mutating func configureBoard(files: Int, ranks: Int) {
        let rankRow = [ChessPiece?](repeating: nil, count: ranks)
        data = Array(repeating: rankRow, count: files)
    }
    
    private mutating func configureInitialChessPiece() {
        for rank in 0..<8 {
            addPiece(Pawn(teamColor: .white), at: Position(file: 1, rank: rank))
            addPiece(Pawn(teamColor: .black), at: Position(file: 6, rank: rank))
        }
    }
    
    // MARK: - Method
    
    @discardableResult
    mutating func move(from origin: Position, to destination: Position) -> Bool {
        guard
            let piece = piece(at: origin),
            piece.canMove(from: origin, to: destination, board: self)
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
            data[position.file][position.rank]
        }
        set {
            data[position.file][position.rank] = newValue
        }
    }
}
