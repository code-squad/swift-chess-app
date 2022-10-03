//
//  MoveCommandParserTests.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/09/29.
//

import XCTest
@testable import SwiftChess

final class MoveCommandParserTests: XCTestCase {

    private var sut: MoveCommandParser?

    override func setUp() {
        super.setUp()
        sut = .live(commandValidator: .live)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_A1에서A2로이동하는유효한입력을하면_A1시작점과A2도착점으로파싱된다() throws {
        let command = "A1->A2"

        let parsed = try sut?.parse(command)

        XCTAssertEqual(parsed?.startPoint, .A1)
        XCTAssertEqual(parsed?.endPoint, .A2)
    }

    func test_A7에서A8로이동하는유효한입력을하면_A7시작점과A8도착점으로파싱된다() throws {
        let command = "A7->A8"

        let parsed = try sut?.parse(command)

        XCTAssertEqual(parsed?.startPoint, .A7)
        XCTAssertEqual(parsed?.endPoint, .A8)
    }

    func test_B1에서A1으로이동하는유효한입력을하면_B1시작점과A1도착점으로파싱된다() throws {
        let command = "A1->B1"

        let parsed = try sut?.parse(command)

        XCTAssertEqual(parsed?.startPoint, .A1)
        XCTAssertEqual(parsed?.endPoint, .B1)
    }

    func test_G1에서H1으로이동하는유효한입력을하면_G1시작점과H1도착점으로파싱된다() throws {
        let command = "G1->H1"

        let parsed = try sut?.parse(command)

        XCTAssertEqual(parsed?.startPoint, .G1)
        XCTAssertEqual(parsed?.endPoint, .H1)
    }

    func test_H7에서H8로이동하는유효한입력을하면_H7시작점과H8도착점으로파싱된다() throws {
        let command = "H7->H8"

        let parsed = try sut?.parse(command)

        XCTAssertEqual(parsed?.startPoint, .H7)
        XCTAssertEqual(parsed?.endPoint, .H8)
    }

    func test_G8에서H8로이동하는유효한입력을하면_H7시작점과H8도착점으로파싱된다() throws {
        let command = "G8->H8"

        let parsed = try sut?.parse(command)

        XCTAssertEqual(parsed?.startPoint, .G8)
        XCTAssertEqual(parsed?.endPoint, .H8)
    }

    func test_지정되지구분형식으로명령어를입력하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "A1>A2"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }

    func test_A1에서A0로이동하는유효하지않은입력을하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "A1->A0"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }

    func test_H1에서H0로이동하는유효하지않은입력을하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "H1->H0"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }

    func test_H1에서I1으로이동하는유효하지않은입력을하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "H1->I1"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }

    func test_A8에서A9으로이동하는유효하지않은입력을하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "A8->A9"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }

    func test_H8에서H9으로이동하는유효하지않은입력을하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "H8->H9"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }

    func test_H8에서I8로이동하는유효하지않은입력을하면_파싱에실패하여검증실패에러를던진다() throws {
        let command = "H8->I8"

        XCTAssertThrowsError(try sut?.parse(command)) { error in
            XCTAssertEqual(error as? MoveMoveCommandParserError, .validationFailed)
        }
    }
}
