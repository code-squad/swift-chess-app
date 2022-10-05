//
//  Player.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/05.
//

import Foundation

protocol Player {
    var team: Color { get }
    var score: Int { get }
    var board: Board { get }
    func move(from current: String, to target: String) -> Bool
}
extension Player {
    func move(from current: String, to target: String) -> Bool {
        guard
            current.count == 2,
            target.count == 2
        else { return false }
        guard
            let currentFile = Board.File(value: String(current[current.startIndex])),
            let currentRank = Board.Rank(value: String(current[current.index(after: current.startIndex)])),
            let targetFile = Board.File(value: String(target[target.startIndex])),
            let targetRank = Board.Rank(value: String(target[target.index(after: current.startIndex)]))
        else {
            return false
        }
        let piecePosition = Board.Position(x: currentFile, y: currentRank)
        let targetPosition = Board.Position(x: targetFile, y: targetRank)
        return board.move(from: piecePosition, to: targetPosition)
    }
}

class BlackPlayer: Player {
    let team: Color = .black
    let board: Board
    var score: Int {
        board.score().black
    }

    init(board: Board) {
        self.board = board
    }
}
class WhitePlayer: Player {
    let team: Color = .white
    let board: Board
    var score: Int {
        board.score().white
    }

    init(board: Board) {
        self.board = board
    }
}
