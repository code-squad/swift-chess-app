//
//  BoardTests.swift
//  ChessGameTests
//
//  Created by JunHeeJo on 9/27/22.
//

import XCTest
@testable import ChessGame

final class ChessBoardTests: XCTestCase {
    var sut: Board!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ChessBoard()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testPawn_whenReset_pawnCountSetRulesPawnCount() {
        sut.pieces = [Pawn(color: .black), Pawn(color: .white)]
        
        sut.resetPieces()
        
        XCTAssertEqual(ChessRules().pawnCount * 2, sut.pieces.count)
    }
}
