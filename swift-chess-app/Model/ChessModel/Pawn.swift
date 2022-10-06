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
    
    func movablePaths(_ currentChessPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition] {
        // Pawn은 앞좌우 세 방향 가능
        
        var movablePaths = [ChessPosition]()
        
        // 앞 체크
        // 앞은 진영에 따라 달라지므로, 두개 다 체크.
        if playerFaction == .Black, currentChessPosition.rankInt + 1 < ChessRule.boardSize {
            if let chessPosition = ChessPosition(rank: currentChessPosition.rankInt + 1, file: currentChessPosition.fileInt) {
                movablePaths.append(chessPosition)
            }
        } else if playerFaction == .White, currentChessPosition.rankInt - 1 >= 0 {
            if let chessPosition = ChessPosition(rank: currentChessPosition.rankInt - 1, file: currentChessPosition.fileInt) {
                movablePaths.append(chessPosition)
            }
            
        }
        // 왼쪽 체크
        if currentChessPosition.fileInt - 1 >= 0 {
            if let chessPosition = ChessPosition(rank: currentChessPosition.rankInt, file: currentChessPosition.fileInt - 1) {
                movablePaths.append(chessPosition)
            }
            
        }
        // 오른쪽 체크
        if currentChessPosition.fileInt + 1 < ChessRule.boardSize {
            if let chessPosition = ChessPosition(rank: currentChessPosition.rankInt, file: currentChessPosition.fileInt + 1) {
                movablePaths.append(chessPosition)
            }
        }
        
        return movablePaths
    }
}
