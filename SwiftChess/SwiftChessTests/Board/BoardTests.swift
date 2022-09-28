//
//  BoardTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/09/28.
//

import XCTest
@testable import SwiftChess

final class BoardTests: XCTestCase {

    private var sut: Board?

    override func setUp() {
        super.setUp()
        sut = Board()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
