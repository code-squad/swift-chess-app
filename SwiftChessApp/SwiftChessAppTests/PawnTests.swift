//
//  PawnTests.swift
//  SwiftChessAppTests
//
//  Created by Freddy on 2022/09/27.
//

import XCTest
@testable import SwiftChessApp

final class PawnTests: XCTestCase {
  var blackPawn: Pawn!
  var whitePawn: Pawn!

  override func setUp() {
    super.setUp()

    blackPawn = Pawn(player: .black)
    whitePawn = Pawn(player: .white)
  }

  func testBlackPawnNextPositions() {
    let positions = blackPawn.availableNextPositions(from: .init(string: "B2")!)

    XCTAssertEqual(Set(positions), Set([.init(string: "A2")!, .init(string: "C2")!, .init(string: "B3")!]))
  }

  func testWhitePawnNextPositions() {
    let positions = whitePawn.availableNextPositions(from: .init(string: "G7")!)

    XCTAssertTrue(positions.contains(Position(string: "G6")!))
    XCTAssertTrue(positions.contains(Position(string: "F7")!))
    XCTAssertTrue(positions.contains(Position(string: "H7")!))
    XCTAssertFalse(positions.contains(Position(string: "G8")!))
    XCTAssertFalse(positions.contains(Position(string: "E5")!))
  }
}
