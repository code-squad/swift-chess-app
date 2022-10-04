//
//  MoveCommandParser.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

struct MoveCommand {
    let startPoint: BoardLocation
    let endPoint: BoardLocation
}

/// 사용자 입력을 해석하는 타입.
struct MoveCommandParser {

    enum Configuration {
        static let commandSeparator: String = "->"
    }

    /// 문자열 형식의 사용자 명령문을 해석하여 ``MoveCommand`` 인스턴스로 반환한다.
    var parse: (_ command: String) throws -> MoveCommand?
}

extension MoveCommandParser {

    static func live(commandValidator: MoveCommandValidator = .live) -> Self {
        return Self(
            parse: { command in
                let locations = command.split(separator: Self.Configuration.commandSeparator)

                guard commandValidator.validate(locations) else {
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
        )
    }

    /// `Substring` 타입의 문자열을 ``BoardLocation`` 인스턴스로 바꾸어 반환한다.
    /// ``MoveCommandParser/validate(_:)``를 통해 검증된 결과만 전달해주어야 한다.
    private static func makeLocation(with substring: Substring) throws -> BoardLocation {
        guard let fileSubstring = substring.first,
              let rankSubstring = substring.last else {
            throw MoveMoveCommandParserError.fileOrRankCharacterNotExists
        }

        let minimumFileAsciiValue = BoardLocation.File.minimumCase?.asciiValue ?? 0
        let fileInteger = String(fileSubstring).asciiValue - minimumFileAsciiValue

        guard let rankInteger = Int(String(rankSubstring)) else {
            throw MoveMoveCommandParserError.enteredRankCannotBeCastedToInteger
        }

        guard let file = BoardLocation.File(rawValue: fileInteger + 1) else {
            throw MoveMoveCommandParserError.invalidFile(String(fileSubstring))
        }

        guard let rank = BoardLocation.Rank(rawValue: rankInteger) else {
            throw MoveMoveCommandParserError.invalidRank(rankInteger)
        }
        return BoardLocation(file: file, rank: rank)
    }
}
