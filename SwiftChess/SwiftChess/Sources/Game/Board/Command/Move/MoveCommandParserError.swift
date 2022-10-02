//
//  MoveMoveCommandParserError.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

import Foundation

enum MoveMoveCommandParserError: Equatable {
    /// 유효하지 않은 명령
    case invalidCommand
    /// 검증 실패(형식에 맞지않음 등)
    case validationFailed
    /// 검증을 마친 문자열이 사라짐(발생하지 않음)
    case locationStringsNotExist
    /// 검증을 마친 캐릭터가 사라짐(발생하지 않음)
    case fileOrRankCharacterNotExists
    /// Location 인스턴스 생성 중 rank 전달인자가 정수형이 아님
    case enteredRankCannotBeCastedToInteger
    /// 유효하지 않은 범위의 Rank가 전달됨
    case invalidRank(Int)
    /// 유효하지 않은 범위의 File이 전달됨
    case invalidFile(String)
}

extension MoveMoveCommandParserError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .invalidCommand:
            return "유효하지 않은 명령입니다. 지정된 구분자(->)를 하나만 정확히 입력해주세요."

        case .validationFailed:
            return "출발점과 도착점이 형식에 맞지 않습니다. File은 A~H, Rank는 1~8까지 값을 입력해주세요."

        case .locationStringsNotExist:
            return "해당 현상 발생 시 고객센터로 문의해주세요 (locationStringsNotExist)."

        case .fileOrRankCharacterNotExists:
            return "해당 현상 발생 시 고객센터로 문의해주세요 (fileOrRankCharacterNotExists)."

        case .enteredRankCannotBeCastedToInteger:
            return "Rank는 한 자리 정수여야 합니다."

        case let .invalidRank(rank):
            return "Rank의 범위는 1~8입니다. 입력한 Rank: \(rank)"

        case let .invalidFile(file):
            return "File의 범위는 A~H입니다. 입력한 File: \(file)"
        }
    }
}
