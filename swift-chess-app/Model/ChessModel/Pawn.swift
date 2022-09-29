//
//  Pawn.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

class Pawn: ChessUnitProtocol {
    let type: ChessUnitType = .Pawn
    let faction: PlayerFaction
    
    init(faction: PlayerFaction) {
        self.faction = faction
    }
    
    func movablePaths(_ currentPosition: ChessPosition) -> [ChessPosition] {
        // Pawn은 앞좌우 세 방향 가능
        
        var positions = [ChessPosition]()
        
        // 앞 체크
        // 앞은 진영에 따라 달라지므로, 두개 다 체크.
        if faction == .Black, currentPosition.rank + 1 < ChessRule.boardSize {
            positions.append(ChessPosition(rank: currentPosition.rank + 1, file: currentPosition.file))
        } else if faction == .White, currentPosition.rank - 1 >= 0 {
            positions.append(ChessPosition(rank: currentPosition.rank - 1, file: currentPosition.file))
        }
        // 왼쪽 체크
        if currentPosition.file - 1 >= 0 {
            positions.append(ChessPosition(rank: currentPosition.rank, file: currentPosition.file - 1))
        }
        // 오른쪽 체크
        if currentPosition.file + 1 < ChessRule.boardSize {
            positions.append(ChessPosition(rank: currentPosition.rank, file: currentPosition.file + 1))
        }
        
        return positions
    }
}
