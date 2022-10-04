//
//  Piece.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/01.
//

import Foundation

protocol Piece: PiecePresentable {
    
    var nextPossiblePositions: [Position] { get }
    var position: Position { get }
    var user: User { get }
    var score: Int { get }
    
    func move(to position: Position) -> Bool
}

protocol PiecePolicy: PiecePresentable {
    func resetPiece(in matrix: [[Board.BlockState]], by user: User) -> [[Board.BlockState]]?
}

protocol PiecePresentable {
    var iconString: String { get }
}
