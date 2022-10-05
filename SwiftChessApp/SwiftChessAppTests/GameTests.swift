//
//  GameTests.swift
//  SwiftChessAppTests
//
//  Created by taehyeon.lee on 2022/10/05.
//

import XCTest

final class GameTests: XCTestCase {

    func test_이동_성공() throws {
        let game = Game()
        let result = game.input("G7->G6")
        XCTAssertTrue(result)
    }

    func test_이동_실패() throws {
        let game = Game()
        let result = game.input("G8->G6")
        XCTAssertFalse(result)
    }

}
