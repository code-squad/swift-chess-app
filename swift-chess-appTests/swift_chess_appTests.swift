//
//  swift_chess_appTests.swift
//  swift-chess-appTests
//
//  Created by 김호종 on 2022/09/25.
//

import XCTest
@testable import swift_chess_app

final class swift_chess_appTests: XCTestCase {
    var cc: ChessController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        cc = ChessController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cc = nil
        
        try super.tearDownWithError()
    }
    
    // MARK: - Utility 테스트
    /// Utility에 존재하는 함수들을 테스트합니다.
    func testCommandInput() {
        
    }

    func testPlay() throws {
        /// 체스 테스트
//        cc.move(inputString: "A2->A3")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "A7->A6")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "A3->A4")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "A6->A5")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "A4->A5")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "A3->A4")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "B7->B6")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "A5->A6")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
//        cc.move(inputString: "B6->A6")
//        print(cc.display())
//        print("점수: 흑:\(cc.score.black) 백:\(cc.score.white)")
    }
    
    func testChessPositionStruct() {
        /// String -> Position
        XCTAssertEqual(ChessPosition("A1"), ChessPosition(rank: 0, file: 0))
        XCTAssertEqual(ChessPosition("H8"), ChessPosition(rank: 7, file: 7))
        XCTAssertNotEqual(ChessPosition("A1"), ChessPosition(rank: 0, file: 5))
        /// Postion -> String
        XCTAssertEqual(ChessPosition("A1").position, "A1")
        XCTAssertEqual(ChessPosition("H8").position, "H8")
        XCTAssertNotEqual(ChessPosition("A1").position, "A2")
    }
    
    func testinputCommand() {
        /// 문자열의 형태 검사
        XCTAssertTrue(inputValidate("A2->A3")) /// 현재는 문자의 형태와 보드판의 범위안에 포함되어있는지만 검사하므로 True
        XCTAssertTrue(inputValidate("A2->H8"))
        XCTAssertFalse(inputValidate("->H8"))
        XCTAssertFalse(inputValidate("->"))
        XCTAssertFalse(inputValidate(""))
        XCTAssertFalse(inputValidate("A2A3"))
        XCTAssertFalse(inputValidate("Z1->A5"))
        XCTAssertFalse(inputValidate("ZZ->ㅋㅋ"))
    }
    
    func testRegex() {
        XCTAssertFalse(positionStringValidate("AAA"))
        XCTAssertFalse(positionStringValidate("A1A"))
        XCTAssertFalse(positionStringValidate("A"))
        XCTAssertFalse(positionStringValidate("A0"))
        XCTAssertTrue(positionStringValidate("A1"))
        XCTAssertFalse(positionStringValidate("A111"))
        XCTAssertFalse(positionStringValidate("1A"))
        XCTAssertTrue(positionStringValidate("H8"))
        XCTAssertFalse(positionStringValidate("H9"))
        XCTAssertFalse(positionStringValidate("I8"))
        XCTAssertFalse(positionStringValidate("I9"))
        XCTAssertFalse(positionStringValidate("1A"))
    }
    
    func testInit() {
        let display = cc.display()
        let initDisplay =
        " ABCDEFGH\n" +
        "1........\n" +
        "2♟♟♟♟♟♟♟♟\n" +
        "3........\n" +
        "4........\n" +
        "5........\n" +
        "6........\n" +
        "7♙♙♙♙♙♙♙♙\n" +
        "8........\n" +
        " ABCDEFGH"
        
        XCTAssertEqual(display, initDisplay)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
