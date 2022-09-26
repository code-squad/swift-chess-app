//
//  Pawn.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/27.
//

protocol Pawnable {
    func moveablePosition() -> String?
}

final class Pawn: Pawnable {
    
    enum `Type` {
        case white
        case black
    }
    
    struct Position {
        var row: String
        var column: String
    }
    
    private var currentPosition: Position
    private let type: `Type`
    private let minRank: String
    private let maxRank: String
    
    init(
        currentPosition: Position,
        type: `Type`,
        minRank: String,
        maxRank: String
    ) {
        self.currentPosition = currentPosition
        self.type = type
        self.minRank = minRank
        self.maxRank = maxRank
    }
    
    func moveablePosition() -> String? {
        guard currentPosition.column != minRank
                && currentPosition.column != maxRank else {
            return nil
        }
        
        var nextRank = Int(currentPosition.column)!
        if type == .white { nextRank -= 1 }
        if type == .black { nextRank += 1 }
        
        return currentPosition.row + "\(nextRank)"
    }
}
