//
//  ScoreManager.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class ScoreManager {
    
    struct ScoreOptions: OptionSet {
        let rawValue: Int

        static let white = ScoreOptions(rawValue: 1 << 0)
        static let black = ScoreOptions(rawValue: 2 << 0)
        
        static let all: ScoreOptions = [.white, .black]
    }
    
    func caculateScore(board: ChessBoard.BoardDataType, option: ScoreOptions) -> Int {
        
        let boardPieces = board.map { $1 }
        var pieces = [ChessPiece]()
        
        if option.contains(.white) {
            pieces.append(contentsOf: boardPieces.filter({ $0.color == .white }))
        }
        
        if option.contains(.black) {
            pieces.append(contentsOf: boardPieces.filter({ $0.color == .black }))
        }
        
        return pieces.reduce(0) { $0 + $1.score }
    }
}
