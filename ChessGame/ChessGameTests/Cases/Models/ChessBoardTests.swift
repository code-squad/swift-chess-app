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
}
