//
//  BoardPrinterTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/03.
//

import XCTest
@testable import SwiftChess

final class BoardPrinterTests: XCTestCase {

    func test_printFormattedBoard를호출하면_BoardFormatter의formatBoard를한번호출한다() {
        var actualFormatBoardCallCount = 0
        let expectedFormatBoardCallCount = 1
        let boardFormatter = BoardFormatter(
            formatBoard: { _ in
                actualFormatBoardCallCount += 1
                return ""
            }
        )
        let sut: BoardPrinter = .live(boardFormatter: boardFormatter)

        sut.printFormattedBoard([])

        XCTAssertEqual(actualFormatBoardCallCount, expectedFormatBoardCallCount)
    }
}
