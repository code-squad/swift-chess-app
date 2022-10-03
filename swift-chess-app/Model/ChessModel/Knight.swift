//
//  Knight.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

struct Knight: ChessUnitProtocol {
    var type: ChessUnitType
    
    var playerFaction: PlayerFaction
    
    func movablePaths(_ currentChessPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition] {
        var chessPositions = [ChessPosition]()
        
        let range = [ // 시계방향으로 범위 체크
            (-2, -1), (-2, 1), // 위
            (-1, 2), (1, 2), // 오른쪽
            (2, -1), (2, 1), // 아래
            (-1, -2), (1, -2) // 왼쪽
        ]
        
        for position in range {
            let rank = currentChessPosition.rankInt + position.0
            let file = currentChessPosition.fileInt + position.1
            
            if let chessPosition = ChessPosition(rank: rank, file: file) {
                chessPositions.append(chessPosition)
            }
        }
        
        return chessPositions
    }
}
