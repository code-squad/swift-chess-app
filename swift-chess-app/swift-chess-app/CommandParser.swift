//
//  CommandParser.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

struct Command {
    let fromLocation: Location
    let toLocation: Location
}

enum CommandParser {
    enum Error: LocalizedError {
        case wrongFormat
        case wrongRank
        case wrongFile
        
        
        var errorDescription: String? {
            switch self {
            case .wrongFormat:
                return "잘못된 명령 형식입니다. A2->A3 형태로 입력해주세요"
            case .wrongRank:
                return "rank는 A~H 사이의 알파벳이어야 합니다."
            case .wrongFile:
                return "file은 1~8사이의 숫자여야 합니다."
            }
        }
    }
    static func parse(commandValue: String) throws -> Command {
        let commands = commandValue.split(separator: "->")
        guard commands.count == 2,
              commands[0].count == 2,
              commands[1].count == 2 else {
            throw Error.wrongFormat
        }
        
        
        let fromLocation = try parseLocation(String(commands[0]))
        let toLocation = try parseLocation(String(commands[1]))
        return .init(fromLocation: fromLocation, toLocation: toLocation)
    }
    
    private static func parseLocation(_ locationValue: String) throws -> Location {
        let rankIndex = locationValue.index(locationValue.startIndex, offsetBy: 1)
        let fileIndex = locationValue.index(locationValue.startIndex, offsetBy: 0)
        
        let rankChar = locationValue[rankIndex]
        let fileChar = locationValue[fileIndex]
        
        guard let fileAlphabet = UpperAlphabet(value: String(fileChar)),
              let file = UpperAlphabets.index(fileAlphabet),
              ChessConstant.rankRange.contains(file) else {
            throw Error.wrongRank
        }
        
        guard var rank = Int(String(rankChar)),
              ChessConstant.fileRange.contains(rank - 1) else {
            throw Error.wrongFile
        }
        rank -= 1
        
        return Location(rank: rank, file: rank)
    }
}
