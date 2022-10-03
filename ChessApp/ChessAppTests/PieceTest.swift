//
//  PieceTest.swift
//  ChessAppTests
//
//  Created by seongmin.kim on 2022/10/03.
//

import XCTest
@testable import ChessApp

final class PieceTest: XCTestCase {
    
   

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_pawn이동_성공() throws {
        XCTAssertTrue(Pawn(color: .black).validToMovePosition(current: Position(file: .A, rank: .two), to: Position(file: .A, rank: .three)))
        XCTAssertTrue(Pawn(color: .black).validToMovePosition(current: Position(file: .B, rank: .two), to: Position(file: .B, rank: .four)))
        XCTAssertTrue(Pawn(color: .black).validToMovePosition(current: Position(file: .C, rank: .two), to: Position(file: .C, rank: .five)))
    }
    
    func test_pawn이동_실패() throws {
        XCTAssertFalse(Pawn(color: .black).validToMovePosition(current: Position(file: .D, rank: .two), to: Position(file: .A, rank: .two)))
        XCTAssertFalse(Pawn(color: .black).validToMovePosition(current: Position(file: .E, rank: .two), to: Position(file: .F, rank: .six)))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
