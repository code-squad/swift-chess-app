//
//  LocationTest.swift
//  swift-chess-appTests
//
//  Created by nylah.j on 2022/09/28.
//

import XCTest
@testable import swift_chess_app

final class LocationTest: XCTestCase {
    func test_plusRank() {
        // given
        var location: Location = .init(rank: 0, file: 0)
        
        // when
        let resultLocation = location.plusRank(1)
        
        // then
        XCTAssertEqual(resultLocation, Location(rank: 1, file: 0))
    }
    
    func test_plusFile() {
        // given
        var location: Location = .init(rank: 0, file: 0)
        
        // when
        let resultLocation = location.plusFile(1)
        
        // then
        XCTAssertEqual(resultLocation, Location(rank: 0, file: 1))
    }
    
    func test_minusRank() {
        // given
        var location: Location = .init(rank: 0, file: 0)
        
        // when
        let resultLocation = location.minusRank(1)
        
        // then
        XCTAssertEqual(resultLocation, Location(rank: -1, file: 0))
    }
    
    func test_minusFile() {
        // given
        var location: Location = .init(rank: 0, file: 0)
        
        // when
        let resultLocation = location.minusFile(1)
        
        // then
        XCTAssertEqual(resultLocation, Location(rank: 0, file: -1))
    }
    
    func test_isRank() {
        // given
        var location: Location = .init(rank: 7, file: 0)
        
        // when
        let equalResult = location.isRank(7)
        let nonEqualResult = location.isRank(8)
        
        
        // then
        XCTAssertTrue(equalResult)
        XCTAssertFalse(nonEqualResult)
    }
}
