//
//  Board.swift
//  ChessGame
//
//  Created by JunHeeJo on 9/27/22.
//

import Foundation

@objc protocol BoardDelegate {
    func didMoved(isMoved: Bool)
}

protocol Board {
    var board: [[Piece?]] { get }
    var delegate: BoardDelegate? { get set }
    
    func resetPieces()
    func move(_ piece: Piece, to: String) -> Bool
}
