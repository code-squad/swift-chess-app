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
}
