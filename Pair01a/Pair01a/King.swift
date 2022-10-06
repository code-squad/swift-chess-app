//
//  King.swift
//  Pair01a
//
//  Created by Ador on 2022/10/06.
//

import Foundation

protocol King {
    var position: Position { get } // 현재 위치
    var initializablePosition: Position { get }
    func movable(to position: Position) -> Bool
    func isSame(with: King) -> Bool
}

class BlackKing: King {
    
    var position: Position
    let initializablePosition: Position = Position(rank: .one, file: .d)
    
    init(position: Position) {
        self.position = position
    }

    func initializable() -> Bool {
        return position == initializablePosition
    }
    
    func movable(to position: Position) -> Bool {
        let top = Position(rank: position.rank.advanced(by: 1), file: position.file.advanced(by: 0))
        let bottom = Position(rank: position.rank.advanced(by: -1), file: position.file.advanced(by: 0))
        let left = Position(rank: position.rank.advanced(by: 0), file: position.file.advanced(by: -1))
        let right = Position(rank: position.rank.advanced(by: 0), file: position.file.advanced(by: 1))
        let movablePosition = [top, bottom, left, right]
        return movablePosition.contains(position)
    }
    
    func isSame(with: King) -> Bool {
        return true
    }
}

class WhiteKing: King {
    
    var position: Position
    let initializablePosition: Position = Position(rank: .eight, file: .d)
    
    init(position: Position) {
        self.position = position
    }

    func initializable() -> Bool {
        return position == initializablePosition
    }
    
    func movable(to position: Position) -> Bool {
        return true
    }
    
    func isSame(with: King) -> Bool {
        return true
    }
}
