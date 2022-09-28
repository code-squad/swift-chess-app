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
    
    // MARK: - Status
    func testChess_whenInit_statusIsReady() {
        XCTAssertEqual(sut.status, .ready)
    }
    
    func testChess_whenStart_statusChangeInProgress() {
        sut.start()
        
        XCTAssertEqual(sut.status, .inProgress)
    }
    
    // MARK: - Play
    func testTurn_whenStart_whiteTurnFirst() {
        sut.turn = .black
        
        sut.start()
        
        XCTAssertEqual(sut.turn, .white)
    }
    
    func testTurn_whenPieceMoved_turnChange() {
        let previousTurn = sut.turn
        let pawn = Pawn(position: "B2", color: .black)
        
        sut.move(pawn, to: "B3")
        
        XCTAssertNotEqual(previousTurn, sut.turn)
    }
}
