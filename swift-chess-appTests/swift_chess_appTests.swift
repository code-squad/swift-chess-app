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
    /// Command -> ChessPosition까지의 변환입니다.
    func testCommandInput() {
        /// 실제 로직의 기본 순서는 Command 체크 (CommandValidate)-> (Command 체크 마지막에) 유효 위치 체크(postionStringValidate) -> Chess Position 변환 체크 (stringToChessPosition)
        
        /// positionStringValidate 먼저 테스트
        /// 중점을 둔 부분
        /// 올바른 위치 문자열, 올바르지 않은 위치 문자열
        /// 올바르지 않은 문자열은? -> 길이 규격에 맞지 않는 문자열, 데이터 형식에 맞지 않는 문자열(순서가 바뀌었다거나, 허용되지 않은 문자라거나), 빈 문자열(empty)
        XCTAssertTrue(positionStringValidate("A1"))
        XCTAssertTrue(positionStringValidate("A8"))
        XCTAssertTrue(positionStringValidate("H1"))
        XCTAssertTrue(positionStringValidate("H8"))
        XCTAssertTrue(positionStringValidate("B6"))
        XCTAssertTrue(positionStringValidate("C8"))
        XCTAssertFalse(positionStringValidate(""))
        XCTAssertFalse(positionStringValidate("A"))
        XCTAssertFalse(positionStringValidate("11"))
        XCTAssertFalse(positionStringValidate("AB"))
        XCTAssertFalse(positionStringValidate("5B"))
        XCTAssertFalse(positionStringValidate("5959"))
        
        /// CommandValidate 테스트
        /// 중점을 둔 부분
        /// 올바른 커맨드, 올바르지 않은 커맨드
        /// 올바르지 않은 커맨드는? -> 길이 규격에 맞지 않는 커맨드, 데이터 형식에 맞지 않는 커맨드, 빈 커맨드
        /// 단, 현재 테스트는 커맨드의 문자열 자체 유효성만 검사하기 때문에, 이동 가능한 상황인지(거리나 방향이 올바르다거나, 해당 위치에 내 말이 없다거나)는 테스트하지 않음.
        XCTAssertTrue(commandValidate("A2->A3"))
        XCTAssertTrue(commandValidate("A2->H8"))
        XCTAssertFalse(commandValidate("A1->A2->A3"))
        XCTAssertFalse(commandValidate("H8->H8"))
        XCTAssertFalse(commandValidate("H8-H8"))
        XCTAssertFalse(commandValidate("->H8"))
        XCTAssertFalse(commandValidate("->"))
        XCTAssertFalse(commandValidate(""))
        XCTAssertFalse(commandValidate("A2A3"))
        XCTAssertFalse(commandValidate("Z1->A5"))
        XCTAssertFalse(commandValidate("ZZ->ㅋㅋ"))
        
        /// stringToChessPosition 테스트
        /// 중점을 둔 부분
        /// 역으로 확인했을 때 제대로 결과가 나오는가?
        XCTAssertNotNil(stringToChessPosition("A2->A3"))
        XCTAssertNotNil(stringToChessPosition("A2->H8"))
        XCTAssertNotNil(stringToChessPosition("A2->A3"))
        XCTAssertNil(stringToChessPosition("A1->A2->A3"))
        XCTAssertNil(stringToChessPosition("->H8"))
        XCTAssertNil(stringToChessPosition("->"))
        XCTAssertNil(stringToChessPosition(""))
        
        // 위에서 성공으로 테스트 된것에 대해서 추가적으로 제대로 구조체를 뽑아냈는지 테스트
        let testPosition1 = stringToChessPosition("A2->A3")!
        
        let successPosition1 = (current: ChessPosition(rank: 1, file: 0), move: ChessPosition(rank: 2, file: 0))
        let failPosition1 = (current: ChessPosition(rank: 1, file: 1), move: ChessPosition(rank: 1, file: 1))
        
        let testPosition2 = stringToChessPosition("A2->H8")!
        
        let successPosition2 = (current: ChessPosition(rank: 1, file: 0), move: ChessPosition(rank: 7, file: 7))
        let failPosition2 = (current: ChessPosition(rank: 1, file: 0), move: ChessPosition(rank: 5, file: 7))
        
        XCTAssertEqual(testPosition1.current, successPosition1.current)
        XCTAssertEqual(testPosition1.move, successPosition1.move)
        
        XCTAssertNotEqual(testPosition1.current, failPosition1.current)
        XCTAssertNotEqual(testPosition1.move, failPosition1.move)
        
        XCTAssertEqual(testPosition2.current, successPosition2.current)
        XCTAssertEqual(testPosition2.move, successPosition2.move)
        
        XCTAssertEqual(testPosition2.current, failPosition2.current)
        XCTAssertNotEqual(testPosition2.move, failPosition2.move)
    }
    
    // MARK: - Chess Position 테스트
    /// Chess Position을 테스트합니다.
    /// 상호 변환이 들어있기에 각각 테스트를 합니다
    func testChessPosition() {
        /// 현재 코드상 ChessPosition은 오직 Utility 함수에서만 제작되기 때문에, 유효성 검사를 따로 하지 않습니다.
        XCTAssertEqual(ChessPosition("A1"), ChessPosition(rank: 0, file: 0))
        XCTAssertEqual(ChessPosition("A1").position, "A1")
        
        XCTAssertTrue(ChessPosition("A1") == "A1")
        XCTAssertTrue("A1" == ChessPosition(rank: 0, file: 0))
        XCTAssertFalse("A3" == ChessPosition(rank: 0, file: 0))
        XCTAssertFalse("H8" == ChessPosition("A9"))
    }
    
    // MARK: - Pawn 테스트
    /// Pawn같은 경우 제가 설계한 팩션에 따른 이동 가능 거리를 테스트합니다.
    func testPawn() {
        let blackPawn = Pawn(faction: .Black)
        let whitePawn = Pawn(faction: .White)
        
        XCTAssertTrue(blackPawn.movablePaths(ChessPosition("A1")).contains(ChessPosition("A2")))
        XCTAssertTrue(blackPawn.movablePaths(ChessPosition("A1")).contains(ChessPosition("B1")))
        XCTAssertTrue(blackPawn.movablePaths(ChessPosition("A2")).contains(ChessPosition("A3")))
        
        XCTAssertFalse(blackPawn.movablePaths(ChessPosition("A1")).contains(ChessPosition("B2")))
        XCTAssertFalse(blackPawn.movablePaths(ChessPosition("A2")).contains(ChessPosition("A1")))
        XCTAssertFalse(whitePawn.movablePaths(ChessPosition("A2")).contains(ChessPosition("A3")))
    }
    
    // MARK: - Board 테스트
    

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
