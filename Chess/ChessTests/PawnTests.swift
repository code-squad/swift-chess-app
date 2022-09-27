//
//  PawnTests.swift
//  ChessTests
//
//  Created by Lychee Choi on 2022/09/27.
//

import XCTest

final class PawnTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  
  // MARK: - display
  
  func test_display_자신의_위치를_출력해요() throws {
    // given
    let sut = Pawn(
      color: .black,
      position: PawnPosition(rank: 3, file: .d)
    )
    
    // when
    let result = sut.display()
    
    // then
    XCTAssertEqual("D3", result)
  }
}
