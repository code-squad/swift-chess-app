//
//  BoardTests.swift
//  ChessTests
//
//  Created by Lychee Choi on 2022/09/27.
//

import XCTest

class BoardTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  
  // MARK: - setupBoard
  
  func test_setupBoard_보드를_초기생성하면_흑색은_2rank_백색은_7rank에_위치해요() throws {
    // when
    let sut = Board()
    let blackResult = sut.boardState[1].contains(where: { $0 != .black })
    let whiteResult = sut.boardState[6].contains(where: { $0 != .white })
    
    // then
    XCTAssertFalse(blackResult)
    XCTAssertFalse(whiteResult)
  }
  
  func test_setupBoard_보드를_초기생성할_때_초기위치가_아니면_생성하지_않아요() throws {
    // when
    let sut = Board()
    let 세번째줄 = sut.boardState[2].contains(where: { $0 != .empty })
    let 네번째줄 = sut.boardState[3].contains(where: { $0 != .empty })
    let 다섯번째줄 = sut.boardState[4].contains(where: { $0 != .empty })
    let 여섯번째줄 = sut.boardState[5].contains(where: { $0 != .empty })
    
    // then
    XCTAssertFalse(세번째줄)
    XCTAssertFalse(네번째줄)
    XCTAssertFalse(다섯번째줄)
    XCTAssertFalse(여섯번째줄)
  }
  
  func test_setupBoard_보드를_초기생성할_때_생성위치에_다른말이_있으면_해당위치에는_생성하지_않아요() throws {
    // given
    let sut = Board()
    sut.boardState[1][3] = .white
    
    // when
    sut.setupBoard()
    
    // then
    let result = sut.boardState[1].contains(where: { $0 != .black })
    XCTAssertTrue(result)
  }
  
  func test_setupBoard_보드를_초기생성할_때_각_색별로_최대개수_이상은_생성하지_않아요() throws {
    // given
    let sut = Board()
    var blackCount: Int = 0
    var whiteCount: Int = 0
    
    // when
    sut.boardState.forEach {
      $0.forEach {
        if $0 == .black {
          blackCount += 1
        } else if $0 == .white {
          whiteCount += 1
        }
      }
    }
    
    // then
    XCTAssertTrue(blackCount <= 8)
    XCTAssertTrue(whiteCount <= 8)
  }
  
  
  // MARK: - calcScore
  
  func test_calcScore_현재_점수를_계산해요() throws {
    // given
    let sut = Board()
    
    // when
    sut.calcScore()
    
    // then
    XCTAssertTrue(sut.blackScore == 8)
    XCTAssertTrue(sut.whiteScore == 8)
  }
  
  
  // MARK: - move
  
  func test_move_이동가능한위치이고_해당위치에_같은말이_없으면_true를_반환해요() throws {
    // given
    let sut = Board()
    
    // when
    let result = sut.move(
      from: Pawn(color: .black, position: PawnPosition(rank: 2, file: .d)),
      to: Pawn(color: .black, position: PawnPosition(rank: 3, file: .d))
    )
    
    // then
    XCTAssertTrue(result)
  }
  
  func test_move_이동할수없는위치이면_false를_반환해요() throws {
    // given
    let sut = Board()
    
    // when
    let result = sut.move(
      from: Pawn(color: .black, position: PawnPosition(rank: 2, file: .d)),
      to: Pawn(color: .black, position: PawnPosition(rank: 4, file: .d))
    )
    
    // then
    XCTAssertFalse(result)
  }
  
  func test_move_이동할위치에_같은말이_있으면_false를_반환해요() throws {
    // given
    let sut = Board()
    sut.boardState[2][3] = .black
    sut.display()
    // when
    let result = sut.move(
      from: Pawn(color: .black, position: PawnPosition(rank: 2, file: .d)),
      to: Pawn(color: .black, position: PawnPosition(rank: 3, file: .d))
    )
    
    // then
    XCTAssertFalse(result)
  }
}
