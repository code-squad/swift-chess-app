//
//  RookPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

struct RookPiece: ChessPiece {
    let teamColor: TeamColor
    static let score = 5
    var symbol: Character {
        teamColor == .white ? "♖" : "♜"
    }
    
    func isDeltaValid(delta: Delta) -> Bool {
        return delta.rank == 0 || delta.file == 0
    }
    
    func steppingPositions(origin: Position, destination: Position) -> [Position] {
        var result = [Position]()
        let delta = destination - origin
        if delta.file == 0 {
            result = stride(from: origin.rank, through: destination.rank)
                .map { Position(file: origin.file, rank: $0) }
        } else {
            result = stride(from: origin.file, through: destination.file)
                .map { Position(file: $0, rank: origin.rank) }
        }
        result.removeFirst()
        return result
    }
}
