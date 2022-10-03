//
//  Rook.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

struct Rook: ChessUnitProtocol {
    let type: ChessUnitType = .Rook
    
    let playerFaction: PlayerFaction
    
    init(_ playerFaction: PlayerFaction) { self.playerFaction = playerFaction }
    
    func movablePaths(_ currentChessPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition] {
        return ChessUnitMovable.straight(currentChessPosition, board)
    }
}
