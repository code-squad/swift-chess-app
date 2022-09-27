//
//  Utility.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/27.
//
// 현재는 사실상 Command 관련 함수만 들어가 있음.
// 그렇다고 Command로 구역을 나눠 만들기에는 역할이 너무 작고,
// 추후 이런저런 유틸리티성 함수들이 추가될 가능성이 있으므로 분리, 변경 보류.

import Foundation

let inputPattern = "[a-hA-H][1-8]"

let asciiA = 65

func inputValidate(_ input: String) -> Bool {
    guard input.count == 6 else { return false } /// 6글자인지 체크
    
    guard input.contains("->") else { return false } /// -> 문자가 포함되어 있는지 체크
    
    let split = input.split(separator: "->")
    
    guard split.count == 2 else { return false } /// 스플릿된 문자열이 2개인지 체크
    
    guard positionStringValidate(String(split[0])) &&
            positionStringValidate(String(split[0])) else { return false } /// 정상적인 보드판의 위치인지 체크
    
    
    return true
}

func positionStringValidate(_ input: String) -> Bool {
    if input.count == 2, input.range(of: inputPattern, options: .regularExpression) != nil { return true }
    return false
}

func stringToChessPosition(_ input: String) -> (current: ChessPosition, move: ChessPosition)? {
    if !inputValidate(input) { return nil }
    
    let split = input.split(separator: "->")
    
    return (current: ChessPosition(String(split[0])), move: ChessPosition(String(split[1])))
}
