//
//  ChessBoardPresenterTests.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/26.
//

import XCTest
@testable import swift_chess_app

class BoardCLIViewTests: XCTestCase {
    
    var chessBrain: ChessBrain!
    
    var sut: BoardViewable!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        chessBrain = .init(
            user1: User(name: "test1", color: .white),
            user2: User(name: "test2", color: .black)
        )
        sut = BoardCLIView()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        chessBrain = .init(
            user1: User(name: "test1", color: .white),
            user2: User(name: "test2", color: .black)
        )
        sut = BoardCLIView()
    }
    
    func test_board_display() {
        // given
        
        
        // when
        chessBrain.start()
        let chessBoardList = chessBrain.boardToList
        let result: [String] = sut.display(with: chessBoardList)
        
        // then
        XCTAssertEqual(
            result,
            [
                "♜♞♝♚♛♝♞♜",
                "♟♟♟♟♟♟♟♟",
                "........",
                "........",
                "........",
                "........",
                "♙♙♙♙♙♙♙♙",
                "♖♘♗♔♕♗♘♖"
            ]
        )
    }
}
