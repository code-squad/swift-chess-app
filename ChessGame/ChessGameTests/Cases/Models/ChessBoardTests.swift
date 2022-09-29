//
//  BoardTests.swift
//  ChessGameTests
//
//  Created by JunHeeJo on 9/27/22.
//

import XCTest
@testable import ChessGame

final class ChessBoardTests: XCTestCase {
    var sut: ChessBoard!
    var rule: ChessRules!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ChessBoard()
        rule = ChessRules.shared
    }

    override func tearDownWithError() throws {
        rule = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testPawn_whenReset_pawnCountSetRulesPawnCount() {
        sut.resetPieces()
        
        XCTAssertEqual(rule.pawnCount * 2, sut.board.flatMap { $0 }.compactMap { $0 }.count)
    }
    
    func testBoardSize_createdCorrectRankSize() {
        XCTAssertEqual(sut.board.first!.count, rule.boardSize.rank)
    }
    
    func testBoardSize_createdCorrectFileSize() {
        XCTAssertEqual(sut.board.first!.count, rule.boardSize.file)
    }
}
