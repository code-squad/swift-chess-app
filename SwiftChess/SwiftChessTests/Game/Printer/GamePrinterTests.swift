//
//  GamePrinterTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/03.
//

import XCTest
@testable import SwiftChess

final class GamePrinterTests: XCTestCase {

    private var sut: GamePrinter = .live

    func test_printBoardInitializationCompleted() {
        let eventMessage = sut.printBoardInitializationCompleted()

        XCTAssertEqual(eventMessage, "체스 보드를 초기화했습니다.")
    }

    func test_printEnterCommand() {
        let eventMessage = sut.printEnterCommand()

        XCTAssertEqual(eventMessage, "명령을 입력하세요>")
    }
}
