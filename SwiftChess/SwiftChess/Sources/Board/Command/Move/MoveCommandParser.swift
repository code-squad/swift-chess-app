//
//  MoveCommandParser.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

struct MoveCommand {
    let startPoint: Board.Location
    let endPoint: Board.Location
}

/// 사용자 입력을 해석하는 타입.
enum MoveCommandParser {

    enum Configuration {
        static let commandSeparator: String = "->"
    }

    /// 문자열 형식의 사용자 명령문을 해석하여 ``MoveCommand`` 인스턴스로 반환한다.
    static func parse(_ command: String) throws -> MoveCommand {
        let locations = command.split(separator: Self.Configuration.commandSeparator)

        guard CommandValidator.validate(locations) else {
            throw MoveMoveCommandParserError.validationFailed
        }

        guard let startPoint = locations.first,
              let endPoint = locations.last else {
            throw MoveMoveCommandParserError.locationStringsNotExist
        }

        let startPointLocation = try makeLocation(with: startPoint)
        let endPointLocation = try makeLocation(with: endPoint)
        return MoveCommand(
            startPoint: startPointLocation,
            endPoint: endPointLocation
        )
    }

    /// `Substring` 타입의 문자열을 ``Board/Location`` 인스턴스로 바꾸어 반환한다.
    /// ``MoveCommandParser/validate(_:)``를 통해 검증된 결과만 전달해주어야 한다.
    private static func makeLocation(with substring: Substring) throws -> Board.Location {
        guard let fileSubstring = substring.first,
              let rankSubstring = substring.last else {
            throw MoveMoveCommandParserError.fileOrRankCharacterNotExists
        }

        let minimumFileAsciiValue = Board.Location.File.minimumCase?.asciiValue ?? 0
        let fileInteger = String(fileSubstring).asciiValue - minimumFileAsciiValue

        guard let rankInteger = Int(String(rankSubstring)) else {
            throw MoveMoveCommandParserError.enteredRankCannotBeCastedToInteger
        }

        guard let file = Board.Location.File(rawValue: fileInteger + 1) else {
            throw MoveMoveCommandParserError.invalidFile(String(fileSubstring))
        }

        guard let rank = Board.Location.Rank(rawValue: rankInteger) else {
            throw MoveMoveCommandParserError.invalidRank(rankInteger)
        }
        return Board.Location(file: file, rank: rank)
    }
}
