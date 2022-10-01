//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import XCTest
@testable import ChessGame

final class ChessGameTests: XCTestCase {
    
    var game: ChessGame!
    
    override func setUpWithError() throws {
        game = ChessGame()
    }
    
    func testMovement() {
        func moveAndAssert(_ command: String) {
            XCTAssert(move(command))
            let command = parseCommand(command)
            XCTAssertNil(game.board[command.origin])
            XCTAssertNotNil(game.board[command.destination])
        }
        
        ["A2A3", "A7A6", "A3A4", "A6A5", "A4A5"]
            .forEach { moveAndAssert($0) }
    }
    
    func testMovementFails() {
        // 흰색 말이 두 턴 연속으로 이동
        XCTAssert(move("A2A3"))
        XCTAssertFalse(move("A3A4"))
        // 시작점에 이동시킬 기물이 없는 경우
        XCTAssertFalse(move("H5H4"))
    }
    
    private func move(_ command: String) -> Bool {
        let command = parseCommand(command)
        return game.movePiece(from: command.origin, to: command.destination)
    }
    
    private func parseCommand(_ command: String) -> (origin: Position, destination: Position) {
        let args = Array(command)
        return (Position(String(args[0...1]))!, Position(String(args[2...3]))!)
    }
}
