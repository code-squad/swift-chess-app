//
//  CommandParser.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

struct MoveCommand {
    let startPoint: Board.Location
    let endPoint: Board.Location
}

enum CommandParserError: Error {
    case invalidCommand
    case validationFailed
    case locationStringsNotExist
    case fileOrRankCharacterNotExists
}

struct CommandParser {

    static func parse(_ command: String) throws -> MoveCommand {
        let locations = command.split(separator: "->")

        guard validate(locations) else {
            throw CommandParserError.validationFailed
        }

        guard let startPoint = locations.first,
              let endPoint = locations.last else {
            throw CommandParserError.locationStringsNotExist
        }

        let startPointLocation = try makeLocation(with: startPoint)
        let endPointLocation = try makeLocation(with: endPoint)
        return MoveCommand(
            startPoint: startPointLocation,
            endPoint: endPointLocation
        )
    }

    private static func validate(_ locationStrings: [String.SubSequence]) -> Bool {
        guard locationStrings.count == 2 else {
            // TODO: 로그 CommandParserError.invalidCommand
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

        let minimumFileAsciiValue = Board.Configuration.minimumFile.asAsciiValue
        let maximumFileAsciiValue = Board.Configuration.maximumFile.asAsciiValue

        guard (minimumFileAsciiValue...maximumFileAsciiValue).contains(file.asAsciiValue) else {
            return false
        }

        let minimumRank = Board.Configuration.minimumRank
        let maximumRank = Board.Configuration.maximumRank

        guard (minimumRank...maximumRank).contains(rank) else {
            return false
        }
        return true
    }

    private static func makeLocation(with substring: Substring) throws -> Board.Location {
        guard let file = substring.first,
              let rank = substring.last else {
            throw CommandParserError.fileOrRankCharacterNotExists
        }

        return Board.Location(
            rank: String(rank).asRankIndex,
            file: String(file).asFileIndex
        )
    }
}
