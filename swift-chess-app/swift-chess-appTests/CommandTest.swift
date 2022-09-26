//
//  CommandTest.swift
//  swift-chess-appTests
//
//  Created by USER on 2022/09/26.
//

import XCTest
@testable import swift_chess_app

class CommandTest: XCTestCase {

    func test_시작_file_범위_초과_Fail() {
        //given
        let string = "I2->H2"
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }
    
    func test_시작_rank_범위_초과_Fail() {
        //given
        let string = "H9->H8"
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }

    func test_목적지_file_범위_초과_Fail() {
        //given
        let string = "H2->I2"
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }
    
    func test_목적지_rank_범위_초과_Fail() {
        //given
        let string = "H8->H9"
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }
    
    func test_입력_포맷_확인_구분_에러1_Fail() {
        //given
        let string = "A1-<A2"
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }
    
    func test_입력_포맷_확인_구분_에러2_Fail() {
        //given
        let string = "A1-A2"
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }
    
    func test_입력_포맷_확인_스페이싱_Fail() {
        //given
        let string = "A1->A2 "
        //when
        let command = Command.make(inputString: string)
        //then
        XCTAssertNil(command)
    }
    
    func test_A1_To_A2() {
        //given
        let string = "A1->A2"
        //when
        let command = Command.make(inputString: string)
        let fromPosition = command?.fromPosition()
        let toPosition = command?.toPosition()
        //then
        XCTAssertEqual(fromPosition, Position(file: .a, rank: .one))
        XCTAssertEqual(toPosition, Position(file: .a, rank: .two))
    }
    
    func test_A1_To_B1() {
        //given
        let string = "A1->B1"
        //when
        let command = Command.make(inputString: string)
        let fromPosition = command?.fromPosition()
        let toPosition = command?.toPosition()
        //then
        XCTAssertEqual(fromPosition, Position(file: .a, rank: .one))
        XCTAssertEqual(toPosition, Position(file: .b, rank: .one))
    }
}
