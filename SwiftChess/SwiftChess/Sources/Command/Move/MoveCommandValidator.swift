//
//  MoveCommandValidator.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

struct MoveCommandValidator {

    /// ``MoveCommandParser/Configuration/commandSeparator``를 기준으로 분리된 문자열들을 검증한다. 예) ["A1", "A2"]
    var validate: (_ locationStrings: [String.SubSequence]) -> Bool
}

extension MoveCommandValidator {

    static let live = Self(
        validate: { locationStrings in
            guard locationStrings.count == 2 else {
                // TODO: 로그 MoveMoveCommandParserError.invalidCommand
                return false
            }

            guard let startPoint = locationStrings.first else {
                return false
            }

            guard let endPoint = locationStrings.last else {
                return false
            }

            guard validateEach(startPoint) else {
                return false
            }

            guard validateEach(endPoint) else {
                return false
            }

            return true
        }
    )

    /// 시작점 또는 도착점과 같이 하나의 문자열을 검증한다. 예) "A1"
    private static func validateEach(_ locationString: Substring) -> Bool {
        guard locationString.count == 2 else {
            return false
        }

        guard let fileCandidate = locationString.first else {
            return false
        }

        guard let rankCandidate = locationString.last else {
            return false
        }

        let file = String(fileCandidate)
        guard let rank = Int(String(rankCandidate)) else {
            return false
        }

        guard let minimumFileAsciiValue = BoardLocation.File.minimumCase?.asciiValue,
              let maximumFileAsciiValue = BoardLocation.File.maximumCase?.asciiValue else {
            return false
        }

        guard (minimumFileAsciiValue...maximumFileAsciiValue).contains(file.asciiValue) else {
            return false
        }

        guard let minimumRank = BoardLocation.Rank.minimumRawValue,
              let maximumRank = BoardLocation.Rank.maximumRawValue else {
            return false
        }

        guard (minimumRank...maximumRank).contains(rank) else {
            return false
        }
        return true
    }
}
