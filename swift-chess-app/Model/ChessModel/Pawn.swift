//
//  Pawn.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

struct Pawn: ChessUnitProtocol {
    let type: ChessUnitType = .Pawn
    let playerFaction: PlayerFaction
    
    init(playerFaction: PlayerFaction) {
        self.playerFaction = playerFaction
    }
    
    func movablePaths(_ currentChessPosition: ChessPosition) -> [ChessPosition] {
        // Pawn은 앞좌우 세 방향 가능
        
        var movablePaths = [ChessPosition]()
        
        // 앞 체크
        // 앞은 진영에 따라 달라지므로, 두개 다 체크.
        if playerFaction == .Black, currentChessPosition.rank + 1 < ChessRule.boardSize {
            movablePaths.append(ChessPosition(rank: currentChessPosition.rank + 1, file: currentChessPosition.file))
        } else if playerFaction == .White, currentChessPosition.rank - 1 >= 0 {
            movablePaths.append(ChessPosition(rank: currentChessPosition.rank - 1, file: currentChessPosition.file))
        }
        // 왼쪽 체크
        if currentChessPosition.file - 1 >= 0 {
            movablePaths.append(ChessPosition(rank: currentChessPosition.rank, file: currentChessPosition.file - 1))
        }
        // 오른쪽 체크
        if currentChessPosition.file + 1 < ChessRule.boardSize {
            movablePaths.append(ChessPosition(rank: currentChessPosition.rank, file: currentChessPosition.file + 1))
        }
        
        return movablePaths
    }
}
