//
//  GameTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/03.
//

import XCTest
@testable import SwiftChess

final class GameTests: XCTestCase {

    func test_게임을시작하면_초기화완료와체스판현황출력메서드가한번씩호출된다() {
        // set GamePrinter
        var gamePrinter: GamePrinter = .unimplemented
        let expectedInitializationCompletedCallCount = 1
        var actualInitializationCompletedCallCount = 0
        gamePrinter.printBoardInitializationCompleted = {
            actualInitializationCompletedCallCount += 1
            return ""
        }
        let expectedEnterCommandCallCount = 1
        var actualEnterCommandCallCount = 0
        gamePrinter.printEnterCommand = {
            actualEnterCommandCallCount += 1
            return ""
        }
        // set BoardPrinter
        var boardPrinter: BoardPrinter = .unimplemented
        let expectedPrintBoardCallCount = 1
        var actualPrintBoardCallCount = 0
        boardPrinter.printBoard = { _ in
            actualPrintBoardCallCount += 1
            return ""
        }
        // set CommandReader
        var commandReader: CommandReader = .unimplemented
        commandReader.read = { nil }
        let sut: Game = DefaultGame(
            board: DefaultBoard(boardPrinter: boardPrinter),
            printer: gamePrinter,
            commandReader: commandReader,
            moveCommandParser: .unimplemented
        )

        sut.start()

        XCTAssertEqual(
            actualInitializationCompletedCallCount,
            expectedInitializationCompletedCallCount
        )
        XCTAssertEqual(
            actualEnterCommandCallCount,
            expectedEnterCommandCallCount
        )
        XCTAssertEqual(
            actualPrintBoardCallCount,
            expectedPrintBoardCallCount
        )
    }

    func test_유효한이동명령을입력하면_체스판을출력하고차례가바뀐다() {
        let expectedPrintBoardCallCount = 1
        var actualPrintBoardCallCount = 0
        let initialTurn: PieceColor = .white
        let expectedTurn: PieceColor = .black
        var boardPrinter: BoardPrinter = .unimplemented
        boardPrinter.printBoard = { _ in
            actualPrintBoardCallCount += 1
            return ""
        }
        let board: Board = DefaultBoard(
            status: BoardTests.topLeftBlackPawnMock,
            boardPrinter: boardPrinter
        )
        var commandReader: CommandReader = .unimplemented
        commandReader.read = { "A1->A2" }
        let sut: Game = DefaultGame(board: board, commandReader: commandReader)
        XCTAssertEqual(sut.currentTurn, initialTurn)

        sut.proceedNextTurn()

        XCTAssertEqual(actualPrintBoardCallCount, expectedPrintBoardCallCount)
        XCTAssertEqual(sut.currentTurn, expectedTurn)
    }

    func test_유효하지않은이동명령을입력하면_체스판출력을하지않고차례도바뀌지않는다() {
        let expectedPrintBoardCallCount = 0
        var actualPrintBoardCallCount = 0
        let initialTurn: PieceColor = .white
        let expectedTurn: PieceColor = .white
        var boardPrinter: BoardPrinter = .unimplemented
        boardPrinter.printBoard = { _ in
            actualPrintBoardCallCount += 1
            return ""
        }
        let board: Board = DefaultBoard(
            status: BoardTests.topLeftBlackPawnMock,
            boardPrinter: boardPrinter
        )
        var commandReader: CommandReader = .unimplemented
        commandReader.read = { "A1->A0" }
        let sut: Game = DefaultGame(board: board, commandReader: commandReader)
        XCTAssertEqual(sut.currentTurn, initialTurn)

        sut.proceedNextTurn()

        XCTAssertEqual(actualPrintBoardCallCount, expectedPrintBoardCallCount)
        XCTAssertEqual(sut.currentTurn, expectedTurn)
    }
}
