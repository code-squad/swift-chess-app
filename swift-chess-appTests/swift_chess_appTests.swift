//
//  swift_chess_appTests.swift
//  swift-chess-appTests
//
//  Created by 김호종 on 2022/09/25.
//

import XCTest
@testable import swift_chess_app

final class swift_chess_appTests: XCTestCase {
    
    let defaultDisplay = [
        "........",
        "♟♟♟♟♟♟♟♟",
        "........",
        "........",
        "........",
        "........",
        "♙♙♙♙♙♙♙♙",
        "........"
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
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
    /// 현재까지의 구현만 놓고 봤을 때, Board는
    func testBoard() {
        /// Board를 생성하면, 설정된대로 초기화가 이루어진다.
        /// 설정 -> 8x8의 보드판 생성, rank-2에 흑색Pawn 8개, rank-7에 백색Pawn 8개, 생성 이후 유효성 검사, 흑색 플레이어부터 시작.
        /// 체스 위치를 몇번 바꿔보고, 이후 초기화(clear)를 진행해 다시한번 테스트를 진행해본다.
        
        /// init / clear 테스트
        let board = Board()
        testClear(board)
        /// moveCheck, move 테스트
        /// 보드는 초기화만 되어있는 상태.
        XCTAssertTrue(board.moveCheck("C2", "C3"))
        XCTAssertTrue(board.moveCheck("A2", "B2")) // 내 Pawn이 있는데로 가는지 검사하지만, moveCheck에서는 다른말이 있는지 확인하지 않는다.
        XCTAssertFalse(board.moveCheck("B2", "A3")) // 대각선으로 가는가?
        XCTAssertFalse(board.moveCheck("B2", "B1")) // 뒤로가지는가?
        
        XCTAssertTrue(board.move("C2", "C3"))
        XCTAssertFalse(board.move("C2", "C3")) // 이미 위에서 이동했으므로 C2 위치에는 말이 없다. 따라서 Fail이 나오는게 정상.
        XCTAssertFalse(board.move("C3", "D4"))
        XCTAssertTrue(board.move("C3", "D3")) // 위에서 대각선으로 옮기려고 시도했기때문에, 실패후 위치는 그대로. 이번에는 오른쪽으로 옮겨본다.
        XCTAssertFalse(board.move("D3", "D2")) // 뒤로 한번 옮겨본다. (현재는 흑색 플레이어)
        
        board.factionChange() // 팩션 변경
        XCTAssertFalse(board.move("D3", "D4")) // 흑색플레이어의 Pawn을 건드려본다
        XCTAssertFalse(board.move("A7", "A8")) // 뒤로 한번 옮겨본다
        XCTAssertFalse(board.moveCheck("A7", "A8")) // moveCheck로 한번 검사
        XCTAssertTrue(board.move("A7", "A6")) // 다음 테스트를 위해 백색 Pawn 하나를 위에서 이동했던 흑색 Pawn 앞으로 옮긴다.
        XCTAssertTrue(board.move("A6", "A5"))
        XCTAssertTrue(board.move("A5", "B5"))
        XCTAssertTrue(board.move("B5", "C5"))
        XCTAssertTrue(board.move("C5", "D5"))
        XCTAssertTrue(board.move("D5", "D4"))
        
        XCTAssertEqual(board.getScore().black, 8) // 점수가 올바른지 확인
        XCTAssertEqual(board.getScore().white, 8)
        
        /// 위 테스트대로라면 현재 보드의 상태는 이렇게 되어있을 것.
        /// ........
        /// ♟♟.♟♟♟♟♟
        /// ...♟....
        /// ...♙....
        /// ........
        /// ........
        /// .♙♙♙♙♙♙♙
        /// ........
        /// 올바른 상태인지 display로 체크
        var currentDisplay = [
        "........",
        "♟♟.♟♟♟♟♟",
        "...♟....",
        "...♙....",
        "........",
        "........",
        ".♙♙♙♙♙♙♙",
        "........"
        ]
        
        XCTAssertEqual(board.display(), currentDisplay)
        
        XCTAssertTrue(board.moveCheck("D3", "D4")) // 현재는 백색플레이어가 플레이중이므로, 이동은 가능하지만, 실제 이동은 이루어지지 않는다.
        XCTAssertFalse(board.move("D3", "D4"))
        
        XCTAssertTrue(board.move("D4", "D3")) // 흰색 Pawn이 흑색 Pawn을 잡는다.
        
        /// 스코어 체크
        XCTAssertEqual(board.getScore().black, 7) // 점수가 올바른지 확인
        XCTAssertEqual(board.getScore().white, 8)
        
        // 현재 상태의 display 체크
        currentDisplay = [
        "........",
        "♟♟.♟♟♟♟♟",
        "...♙....",
        "........",
        "........",
        "........",
        ".♙♙♙♙♙♙♙",
        "........"
        ]
        
        XCTAssertEqual(board.display(), currentDisplay)
        
        // clear 함수를 실행해서, 모든 항목이 초기화 되었는지 체크, (말 위치 | 점수 | 현재 플레이어)
        board.clear()
        testClear(board)
    }
    
    func testClear(_ board: Board) {
        XCTAssertEqual(board.display(), defaultDisplay)
        XCTAssertEqual(board.getScore().black, 8)
        XCTAssertEqual(board.getScore().white, 8)
        XCTAssertEqual(board.currentFaction, .Black)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

extension Board {
    func moveCheck(_ current: String, _ move: String) -> Bool {
        let currentPosition = ChessPosition(current)
        let movePosition = ChessPosition(move)
        
        return moveCheck(currentPosition, movePosition)
    }
    
    func move(_ currentChessPosition: String, _ moveChessPosition: String) -> Bool {
        let currentPosition = ChessPosition(currentChessPosition)
        let movePosition = ChessPosition(moveChessPosition)

        return move(currentPosition, movePosition)
    }
}
