//
//  ChessGameTest.swift
//  ray-chessTests
//
//  Created by 김상진 on 2022/10/03.
//

import XCTest
@testable import ray_chess

class ChessGameTest: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testPossibleToMove() throws {
        let chessGame = ChessGame()
        
        chessGame.initializePawn()
        let result = chessGame.possibleToMove(position: .init(rank: .seven, file: .A))
        let expectedResult = [Piece.Position(rank: .six, file: .A)]
        XCTAssertEqual(result, expectedResult)
        
        chessGame.initializeRook()
        let result2 = chessGame.possibleToMove(position: .init(rank: .eight, file: .A))
            .sorted { ($0.rank.rawValue, $0.file.rawValue) > ($1.rank.rawValue, $1.file.rawValue) }
        let expectedResult2 = [
            Piece.Position(rank: .eight, file: .B),
            Piece.Position(rank: .eight, file: .C),
            Piece.Position(rank: .eight, file: .D),
            Piece.Position(rank: .eight, file: .E),
            Piece.Position(rank: .eight, file: .F),
            Piece.Position(rank: .eight, file: .G),
        ].sorted { ($0.rank.rawValue, $0.file.rawValue) > ($1.rank.rawValue, $1.file.rawValue) }
        XCTAssertEqual(result2, expectedResult2)
    }
}
