//
//  Game.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

struct GamePrinter {

    var print: (String) -> Void
    var boardInitializationCompletedText: () -> Void
}

final class DefaultGame {

    let board: Board
    let commandReader: CommandReader
    let moveCommandParser: MoveCommandParser

    init(
        board: Board = DefaultBoard(),
        commandReader: CommandReader = .live,
        moveCommandParser: MoveCommandParser = .live(commandValidator: .live)
    ) {
        self.board = board
        self.commandReader = commandReader
        self.moveCommandParser = moveCommandParser
    }

    func start() {

    }
}
