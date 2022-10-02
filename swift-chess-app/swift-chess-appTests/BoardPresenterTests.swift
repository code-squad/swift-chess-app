//
//  ChessBoardPresenterTests.swift
//  swift-chess-appTests
//
//  Created by Haeseok Lee on 2022/09/26.
//

import XCTest
@testable import swift_chess_app

class BoardPresenterTests: XCTestCase {
    
    var chessBrain: ChessBrain!
    
    var sut: BoardViewable!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let inputManager = InputManager()
        chessBrain = .init(
            user1: User(name: "test1", color: .white, controller: inputManager),
            user2: User(name: "test2", color: .black, controller: inputManager)
        )
        sut = BoardPresenter()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        let inputManager = InputManager()
        chessBrain = .init(
            user1: User(name: "test1", color: .white, controller: inputManager),
            user2: User(name: "test2", color: .black, controller: inputManager)
        )
        sut = BoardPresenter()
    }
    
    func test_board_display() {
        // given
        
        
        // when
        chessBrain.start()
        let chessBoardList = chessBrain.boardToList
        let result = sut.display(from: chessBoardList)
        
        // then
        XCTAssertEqual(
            result,
            [
                "........",
                "♟♟♟♟♟♟♟♟",
                "........",
                "........",
                "........",
                "........",
                "♙♙♙♙♙♙♙♙",
                "........"
            ]
        )
    }
    
    func test_board_decorated_display() {
        // given
        
        
        // when
        chessBrain.start()
        let chessBoardList = chessBrain.boardToList
        let result = sut.decoratedDisplay(from: chessBoardList)
        
        // then
        XCTAssertEqual(
            result,
            [
                " ABCDEFGH",
                "1........",
                "2♟♟♟♟♟♟♟♟",
                "3........",
                "4........",
                "5........",
                "6........",
                "7♙♙♙♙♙♙♙♙",
                "8........",
                " ABCDEFGH",
            ]
        )
    }
}
