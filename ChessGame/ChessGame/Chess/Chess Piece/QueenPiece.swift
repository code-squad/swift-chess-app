//
//  QueenPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct QueenPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 9
    var symbol: Character {
        teamColor == .white ? "♕" : "♛"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        return RookPiece(teamColor: teamColor).isDeltaValid(delta: delta) ||
        BishopPiece(teamColor: teamColor).isDeltaValid(delta: delta)
    }
    
    func steppingPositions(origin: Position, destination: Position) -> [Position] {
        let delta = destination - origin
        let bishop = BishopPiece(teamColor: teamColor)
        let rook = RookPiece(teamColor: teamColor)
        
        if bishop.isDeltaValid(delta: delta) {
            return bishop.steppingPositions(origin: origin, destination: destination)
        } else {
            return rook.steppingPositions(origin: origin, destination: destination)
        }
    }
}
