//
//  ChessPieceTesst.swift
//  ChessGameTests
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import XCTest
@testable import ChessGame

final class ChessPieceTests: XCTestCase {
    
    func testDeltaOfWhitePawn() {
        
        let whitePawn = PawnPiece(teamColor: .white)
        XCTAssert(whitePawn.isDeltaValid(delta: Delta(file: 0, rank: 1)))
    }
    
    func testDeltaOfBlackPawn() {
        let blackPawn = PawnPiece(teamColor: .black)
        XCTAssert(blackPawn.isDeltaValid(delta: Delta(file: 0, rank: -1)))
    }
    
    func testDeltasOfBishop() {
        let bishop = BishopPiece(teamColor: .black)
        
        let deltas = [
            Delta(file: 1, rank: 1),
            Delta(file: -1, rank: 1),
            Delta(file: 3, rank: -3),
            Delta(file: -5, rank: -5),
        ]
        for delta in deltas {
            XCTAssert(bishop.isDeltaValid(delta: delta))
        }
    }
    
    func testDeltasOfRook() {
        let rook = RookPiece(teamColor: .black)
        
        let deltas = [
            Delta(file: 0, rank: 1),
            Delta(file: -1, rank: 0),
            Delta(file: 5, rank: 0),
            Delta(file: -7, rank: 0),
        ]
        for delta in deltas {
            XCTAssert(rook.isDeltaValid(delta: delta))
        }
    }
    
    func testDeltasOfKnight() {
        let knight = KnightPiece(teamColor: .white)
        
        let deltas = [
            Delta(file: 2, rank: 1),
            Delta(file: 2, rank: -1),
            Delta(file: -2, rank: 1),
            Delta(file: -2, rank: -1),
            Delta(file: 1, rank: 2),
            Delta(file: 1, rank: -2),
            Delta(file: -1, rank: 2),
            Delta(file: -1, rank: -2)
        ]
        for delta in deltas {
            XCTAssert(knight.isDeltaValid(delta: delta))
        }
    }
    
    func testDeltasOfQueen() {
        let queen = QueenPiece(teamColor: .white)
        
        let deltas = [
            Delta(file: 0, rank: 1),
            Delta(file: -1, rank: 0),
            Delta(file: 5, rank: 0),
            Delta(file: -7, rank: 0),
            Delta(file: 1, rank: 1),
            Delta(file: -1, rank: 1),
            Delta(file: 3, rank: -3),
            Delta(file: -5, rank: -5),
        ]
        for delta in deltas {
            XCTAssert(queen.isDeltaValid(delta: delta))
        }
    }
}
