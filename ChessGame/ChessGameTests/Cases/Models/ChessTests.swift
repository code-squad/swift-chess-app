//
//  ChessTests.swift
//  ChessGameTests
//
//  Created by JunHeeJo on 9/27/22.
//

import XCTest
@testable import ChessGame

final class ChessTests: XCTestCase {
    var sut: Chess!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Chess()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - State
    func testChess_whenInit_stateIsReady() {
        XCTAssertEqual(sut.state, .ready)
    }
    
    func testChess_whenStart_stateChangeInProgress() {
        sut.start()
        
        XCTAssertEqual(sut.state, .inProgress)
    }
    
    func testPieces_whenChessStart_resetPawn() {
        sut.start()
        
        XCTAssertEqual(ChessRules().pawnCount * 2, sut.board.board.flatMap { $0 }.compactMap { $0 }.count)
    }
    
    // MARK: - Play
    func testTurn_whenStart_startingColorTurn() {
        sut.turn = .black
        
        sut.start()
        
        XCTAssertEqual(sut.turn, sut.rule.startingColor)
    }
    
    func testTurn_whenPieceMoved_turnChange() {
        let previousTurn = sut.turn
        let pawn = Pawn(color: .black)
        
        sut.board.delegate = sut
        _ = sut.board.move(pawn, to: "B3")
        
        XCTAssertNotEqual(previousTurn, sut.turn)
    }
}
