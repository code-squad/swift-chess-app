//
//  ChessPieceMovableChecker.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

protocol ChessPieceMovableChecker {
    var movableDirection: [ChessMovableDirection] { get }
    func movablePositions(_ now: Position) -> [Position]
}

extension ChessPieceMovableChecker {
    func checkMovablePosition(direction: ChessMovableDirection,
                              now: Position,
                              movablePositions: [Position]) -> [Position] {
        
        let (directionToFileValue, directionToRankValue) = direction.toCoordinate
        guard let movedFile = File(rawValue: now.file.rawValue + directionToFileValue),
              let movedRank = Rank(rawValue: now.rank.rawValue + directionToRankValue) else { return movablePositions }
        
        let movablePosition = Position(file: movedFile, rank: movedRank)
        let movablePositions = movablePositions + [movablePosition]
        
        return checkMovablePosition(direction: direction,
                                    now: movablePosition,
                                    movablePositions: movablePositions)
    }
    
    func movablePositions(_ now: Position) -> [Position] {
        var positions: [Position] = []
        
        movableDirection.forEach({ direction in
            positions += checkMovablePosition(direction: direction, now: now, movablePositions: [])
        })
        
        return positions
    }
}
