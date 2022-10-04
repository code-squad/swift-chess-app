//
//  ChessPieceMovableChecker.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/04.
//

import Foundation

protocol ChessPieceMovableChecker {
    var movableDirection: [ChessDirection] { get }
    func movablePositions(_ now: Position, limitDepth: Int) -> [Position]
}

extension ChessPieceMovableChecker {
    func checkMovablePosition(direction: ChessDirection,
                              now: Position,
                              movablePositions: [Position],
                              limitDepth: Int) -> [Position] {
        
        let (directionToFileValue, directionToRankValue) = direction.toCoordinate
        guard movablePositions.count < limitDepth,
              let movedFile = File(rawValue: now.file.rawValue + directionToFileValue),
              let movedRank = Rank(rawValue: now.rank.rawValue + directionToRankValue) else { return movablePositions }
        
        let movablePosition = Position(file: movedFile, rank: movedRank)
        let movablePositions = movablePositions + [movablePosition]
        
        return checkMovablePosition(direction: direction,
                                    now: movablePosition,
                                    movablePositions: movablePositions,
                                    limitDepth: limitDepth)
    }
    
    func movablePositions(_ now: Position, limitDepth: Int) -> [Position] {
        var positions: [Position] = []
        
        movableDirection.forEach({ direction in
            positions += checkMovablePosition(direction: direction, now: now, movablePositions: [], limitDepth: limitDepth)
        })
        
        return positions
    }
}
