//
//  Queen.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

struct Queen: ChessUnitProtocol {
    let type: ChessUnitType = .Bishop
    
    let playerFaction: PlayerFaction
    
    init(_ playerFaction: PlayerFaction) { self.playerFaction = playerFaction }
    
    func movablePaths(_ currentChessPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition] {
        return ChessUnitMovable.diagonal(currentChessPosition, board) + ChessUnitMovable.straight(currentChessPosition, board)
    }
}
