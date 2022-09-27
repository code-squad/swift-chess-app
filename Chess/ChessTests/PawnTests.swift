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
  
  
  // MARK: - moveablePositions
  
  func test_moveablePositions_이동할수있는_모든위치를_반환해요() throws {
    // given
    let sut = Pawn(
      color: .black,
      position: PawnPosition(rank: 1, file: .b)
    )
    
    // when
    let result = sut.moveablePositions()
    
    // then
    XCTAssertEqual([
      PawnPosition(rank: 1, file: .a),
      PawnPosition(rank: 1, file: .c),
      PawnPosition(rank: 2, file: .b)
    ], result)
  }
  
  func test_moveablePositions_모서리일_경우_이동할수있는_모든위치를_반환해요() throws {
    // given
    let sut = Pawn(
      color: .black,
      position: PawnPosition(rank: 1, file: .a)
    )
    
    // when
    let result = sut.moveablePositions()
    
    // then
    XCTAssertEqual([
      PawnPosition(rank: 1, file: .b),
      PawnPosition(rank: 2, file: .a)
    ], result)
  }
  
  func test_moveablePositions_흑색은_같거나_더_큰_rank로만_이동할_수_있어요() throws {
    // given
    let sut = Pawn(
      color: .black,
      position: PawnPosition(rank: 1, file: .a)
    )
    
    // when
    let result = sut.moveablePositions().contains(where: { $0.rank < 1 })
    
    // then
    XCTAssertFalse(result)
  }
  
  func test_moveablePositions_흰색은_같거나_더_작은_rank로만_이동할_수_있어요() throws {
    // given
    let sut = Pawn(
      color: .white,
      position: PawnPosition(rank: 7, file: .a)
    )
    
    // when
    let result = sut.moveablePositions().contains(where: { $0.rank > 7 })
    
    // then
    XCTAssertFalse(result)
  }
}
