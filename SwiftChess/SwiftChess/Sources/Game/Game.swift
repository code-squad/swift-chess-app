//
//  Game.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

protocol Game {
    var currentTurn: PieceColor { get }

    func start()
    func proceedNextTurn()
}

final class DefaultGame: Game {

    let board: Board
    let printer: GamePrinter
    let commandReader: CommandReader
    let moveCommandParser: MoveCommandParser
    private(set) var currentTurn: PieceColor = .white

    init(
        board: Board = DefaultBoard(),
        printer: GamePrinter = .live,
        commandReader: CommandReader = .live,
        moveCommandParser: MoveCommandParser = .live(commandValidator: .live)
    ) {
        self.board = board
        self.printer = printer
        self.commandReader = commandReader
        self.moveCommandParser = moveCommandParser
    }

    func start() {
        _ = printer.printBoardInitializationCompleted()
        _ = board.display()

        // TODO: 어느 한 쪽의 King이 잡힐 때까지 반복
        proceedNextTurn()
    }

    func proceedNextTurn() {
        guard let command = readCommand() else {
            // TODO: log error
            return
        }
        guard let moveCommand = parseCommand(command) else {
            // TODO: log error
            return
        }

        do {
            try board.move(with: moveCommand)
        } catch {
            // TODO: log error
        }

        _ = board.display()
        changeTurn()
    }

    private func readCommand() -> String? {
        do {
            _ = printer.printEnterCommand()
            return try commandReader.read()
        } catch {
            print(error)
            // log error
            return nil
        }
    }

    private func parseCommand(_ command: String) -> MoveCommand? {
        do {
            return try moveCommandParser.parse(command)
        } catch {
            print(error)
            return nil
        }
    }

    private func changeTurn() {
        currentTurn = (currentTurn == .white) ? .black : .white
    }
}
