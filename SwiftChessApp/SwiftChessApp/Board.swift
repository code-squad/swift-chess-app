//
//  Board.swift
//  SwiftChessApp
//
//  Created by YoungsunMoon on 2022/09/29.
//

import Foundation

protocol Board {
    func score(completion: (_ whiteScore: Int, _ blackScore: Int) -> Void)
    func display() -> [String]
    func move(from: Position, to: Position) throws -> Bool
}

final class BoardImpl: Board {
    
    private let rankManager: RankManager
    
    init(
        rankManager: RankManager
    ) {
        self.rankManager = rankManager
    }
    
    func score(completion: (_ whiteScore: Int, _ blackScore: Int) -> Void) {
        let (whiteScore, blackScore) = rankManager.score()
        completion(whiteScore, blackScore)
    }
    
    func display() -> [String] {
        return rankManager.rankDescriptions()
    }
    
    func move(from: Position, to: Position) throws -> Bool {
        // TODO: 포지션 검증 및 Pawn 옮기기
        return true
    }
}
