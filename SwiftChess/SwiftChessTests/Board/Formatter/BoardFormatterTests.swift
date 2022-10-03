//
//  BoardFormatterTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/03.
//

import XCTest
@testable import SwiftChess

final class BoardFormatterTests: XCTestCase {

    private var sut: BoardFormatter?

    override func setUp() {
        super.setUp()
        sut = BoardFormatter.live
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_체스판의status를전달하면_포매팅된체스판을반환한다() {
        let targetStatus = BoardTests.topLeftEngagedPawnsMock
        let expected = """
         ABCDEFGH
        1♟.......
        2♙.......
        3........
        4........
        5........
        6........
        7........
        8........
         ABCDEFGH
        """
        let formatted = sut?.formatBoard(targetStatus)

        XCTAssertEqual(formatted, expected)
    }
}
