//
//  Player.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/05.
//

import Foundation

protocol Player: TeamSelectable {
    var initialPieces: [Piece.Type] { get }
}

class BlackPlayer: Player {
    var color: Color { .black }
    var initialPieces: [Piece.Type] {
        [
            BlackKing.self,
            BlackQueen.self,
            BlackRook.self,
            BlackKnight.self,
            BlackBishop.self,
            BlackPawn.self,
        ]
    }
}
class WhitePlayer: Player {
    var color: Color { .white }
    var initialPieces: [Piece.Type] {
        [
            WhiteKing.self,
            WhiteQueen.self,
            WhiteRook.self,
            WhiteKnight.self,
            WhiteBishop.self,
            WhitePawn.self,
        ]
    }
}
