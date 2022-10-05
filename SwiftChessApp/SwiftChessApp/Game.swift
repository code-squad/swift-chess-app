//
//  Game.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/05.
//

import Foundation

class Game {
    let blackPlayer: Player
    let whitePlayer: Player
    private(set) var turn: Color = .white
    private var inputQueue: [String] = []

    init() {
        let board: Board = .init()
        board.newGame()
        blackPlayer = BlackPlayer(board: board)
        whitePlayer = WhitePlayer(board: board)
    }

    func input(_ input: String) -> Bool {
        inputQueue.append(contentsOf: input.components(separatedBy: "->").map { $0.trimmingCharacters(in: .whitespaces) })
        guard inputQueue.count == 2 else { return false }
        let pick = inputQueue[0]
        let target = inputQueue[1]
        switch turn {
        case .black:
            let result = blackPlayer.move(from: pick, to: target)
            if result {
                turn = .white
                return true
            } else {
                return false
            }
        case .white:
            let result = whitePlayer.move(from: pick, to: target)
            if result {
                turn = .black
                return true
            } else {
                return false
            }
        }
    }
}
