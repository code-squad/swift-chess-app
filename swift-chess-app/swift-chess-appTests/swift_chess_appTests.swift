//
//  swift_chess_appTests.swift
//  swift-chess-appTests
//
//  Created by 이재은(Lee, Jaeeun) on 2022/09/27.
//

import XCTest
@testable import swift_chess_app

class swift_chess_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


    func test_입력된_숫자에_맞는_체스판이_생성되었나() {

    }

    func test_체스판의_체스말_개수_확인() {

    }

    func test_백체스말이_이동가능한_위치를_잘찾는지() {

    }

    func test_흑체스말이_이동가능한_위치를_잘찾는지() {

    }

    func test_체스말이_이동하려는위치에_같은색깔_체스말이_있으면_이동안하는지() {

    }

    func test_체스말이_이동하려는위치에_다른색깔_체스말이_있으면_이동했는지() {

    }

    func test_체스말이_이동하려는위치에_비어있으면_이동했는지() {

    }

    func test_체스말이_대각선으로_이동안하는지() {

    }

    func test_체스말이_이동후에_원래있던위치_비었는지() {

    }

    func test_점수출력_정확한지() {

    }

    func test_체스말_초기화위치_맞는지() {

    }

    func test_이동시_올바른위치값이_아니면_오류가나는지() {

    }
}
