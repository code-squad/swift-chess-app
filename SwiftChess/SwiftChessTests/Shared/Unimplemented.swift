//
//  Unimplemented.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/10/04.
//

import XCTest
@testable import SwiftChess

extension BoardFormatter {
    static let unimplemented = Self(
        formatBoard: { _ in
            XCTFail("BoardFormatter.formatboard is unimplemented.")
            return ""
        },
        formatGamePoint: { _ in
            XCTFail("BoardFormatter.formatGamePoint is unimplemented.")
            return ""
        }
    )
}

extension BoardPrinter {
    static let unimplemented = Self(
        printBoard: { _ in
            XCTFail("BoardPrinter.printBoard is unimplemented.")
            return ""
        },
        printCurrentPoints: { _ in
            XCTFail("BoardPrinter.printCurrentPoints is unimplemented.")
            return ""
        }
    )
}

extension MoveCommandParser {
    static let unimplemented = Self(
        parse: { _ in
            XCTFail("MoveCommandParser.parse is unimplemented.")
            return nil
        }
    )
}

extension CommandReader {
    static let unimplemented = Self(
        read: {
            XCTFail("CommandReader.read is unimplemented.")
            return nil
        }
    )
}

extension GamePrinter {
    static let unimplemented = Self(
        printBoardInitializationCompleted: {
            XCTFail("GamePrinter.printBoardInitializationCompleted is unimplemented.")
            return ""
        },
        printEnterCommand: {
            XCTFail("GamePrinter.printEnterCommand is unimplemented.")
            return ""
        }
    )
}
