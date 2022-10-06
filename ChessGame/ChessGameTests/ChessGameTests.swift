//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by Ador on 2022/09/27.
//

import XCTest
@testable import ChessGame

class ChessGameTests: XCTestCase {

    let game = Board()

    override func setUpWithError() throws {
        continueAfterFailure = true
        testInitialize()
    }

    func testInitialize() {
        print("체스 보드를 초기화했습니다.")
        game.initialize()
        game.display()
    }

    func testTurn() {
        XCTAssertEqual(game.turn, .white, "\(game.turn)의 차례입니다.")
    }

    func testMoveWhenNotMyTurn() {
        let result = game.move(from: .init(rank: .two, file: .a) , to: .init(rank: .three, file: .a))
        XCTAssertEqual(result, false, "\(game.turn)의 차례입니다.")
        game.display()
    }

    func testMoveWhenMyTurn() {
        let result = game.move(from: .init(rank: .seven, file: .a) , to: .init(rank: .six, file: .a))
        XCTAssertEqual(result, false)
        game.display()
    }

    func testScore() {
        XCTAssertEqual(game.score(with: .black), 24)
        XCTAssertEqual(game.score(with: .white), 24)
    }
}
