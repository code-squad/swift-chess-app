//
//  WhitePawnTest.swift
//  swift-chess-appTests
//
//  Created by nylah.j on 2022/09/27.
//

import XCTest
@testable import swift_chess_app

final class WhitePawnTest: XCTestCase {

    func test_백색pawn은_더작은rank로만_움직일수있으며_이때_true반환한다() {
        // given
        let fromLocatoin: Location = .init(rank: 0, file: 0)
        let toLocation: Location = .init(rank: -1, file: 0)
        let pawn: ChessPiece = WhitePawn(location: fromLocatoin)
        
        // when
        let result = pawn.move(to: toLocation)
        let resultLocation = pawn.location
        
        // then
        XCTAssertTrue(result)
        XCTAssertEqual(toLocation, resultLocation)
    }
    
    func test_백색pawn은_큰rank로_움직이려고하면_false반환한다() {
        // given
        let fromLocatoin: Location = .init(rank: 0, file: 0)
        let toLocation: Location = .init(rank: 1, file: 0)
        let pawn: ChessPiece = WhitePawn(location: fromLocatoin)
        
        // when
        let result = pawn.move(to: toLocation)
        let resultLocation = pawn.location
        
        // then
        XCTAssertFalse(result)
        XCTAssertNotEqual(toLocation, resultLocation)
    }
    
    func test_한칸만_움직일수있으며_이때_true반환한다() {
        // given
        let fromLocatoin: Location = .init(rank: 0, file: 0)
        let toLocation: Location = .init(rank: -1, file: 0)
        let pawn: ChessPiece = WhitePawn(location: fromLocatoin)
        
        // when
        let result = pawn.move(to: toLocation)
        let resultLocation = pawn.location
        
        // then
        XCTAssertTrue(result)
        XCTAssertEqual(toLocation, resultLocation)
    }
    
    func test_한칸보다_더_많이_움직이면_false반환한다() {
        // given
        let fromLocatoin: Location = .init(rank: 0, file: 0)
        let toLocation: Location = .init(rank: 2, file: 0)
        let pawn: ChessPiece = WhitePawn(location: fromLocatoin)
        
        // when
        let result = pawn.move(to: toLocation)
        let resultLocation = pawn.location
        
        // then
        XCTAssertFalse(result)
        XCTAssertNotEqual(toLocation, resultLocation)
    }
    
    func test_reachableLocations() {
        // given
        let location: Location = .init(rank: 0, file: 0)
        let pawn: ChessPiece = WhitePawn(location: location)
        
        let 
        // when
        
    }
}
