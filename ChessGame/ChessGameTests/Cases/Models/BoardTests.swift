//
//  BoardTests.swift
//  ChessGameTests
//
//  Created by JunHeeJo on 9/27/22.
//

import XCTest
@testable import ChessGame

final class BoardTests: XCTestCase {
    var sut: Board!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Board()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testBoard_whenReset_piecesCountZero() {
        sut.reset()
        
        XCTAssertEqual(sut.pieces.count, 0)
    }
}
