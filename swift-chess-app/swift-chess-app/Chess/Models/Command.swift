//
//  Command.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

enum CommandType {
    case info, move
}

struct Command {
    let type: CommandType
    let commandStrings: [String]
    
    init(type: CommandType, commandStrings: [String]) {
        self.type = type
        self.commandStrings = commandStrings
    }
    
    init?(inputString: String) {
        if let infoCommandStrings = Self.makeInfo(inputString: inputString) {
            self.init(type: .info, commandStrings: infoCommandStrings)
        } else if let movableCommandStrings = Self.makeMove(inputString: inputString) {
            self.init(type: .move, commandStrings: movableCommandStrings)
        } else {
            return nil
        }
    }
    
    func infoPosition() -> Position? {
        guard let infoString = commandStrings.first,
              let fileString = infoString.firstString(),
              let rankString = infoString.lastString(),
              let file = File(rawValue: fileString),
              let rank = Rank(rawValue: rankString) else { return nil }

        return Position(file: file, rank: rank)
    }


    func fromPosition() -> Position? {
        guard let fromString = commandStrings.first,
              let fileString = fromString.firstString(),
              let rankString = fromString.lastString(),
              let file = File(rawValue: fileString),
              let rank = Rank(rawValue: rankString) else { return nil }

        return Position(file: file, rank: rank)
    }

    func toPosition() -> Position? {
        guard let toString = commandStrings.last,
              let fileString = toString.firstString(),
              let rankString = toString.lastString(),
              let file = File(rawValue: fileString),
              let rank = Rank(rawValue: rankString) else { return nil }

        return Position(file: file, rank : rank)
    }
}

extension Command {
    private static func checkInfoRegex(_ str: String?) -> String? {
        guard let str = str else { return nil }
        
        let pattern: String = "[?][A-H][1-8]$"
        if str.range(of: pattern, options: .regularExpression) != nil {
            return str.replacingOccurrences(of: "?", with: "")
        } else {
            return nil
        }
    }
    
    private static func checkMovableRegex(_ str: String?) -> String? {
        guard let str = str else { return nil }
        
        let pattern: String = "[A-H][1-8]$"
        if str.range(of: pattern, options: .regularExpression) != nil {
            return str
        } else {
            return nil
        }
    }
    
    private static func makeInfo(inputString: String) -> [String]? {
        guard let infoString = Self.checkInfoRegex(inputString) else { return nil }
            
        return [infoString]
    }
    
    private static func makeMove(inputString: String) -> [String]? {
        let components = inputString.components(separatedBy: "->")
        
        guard components.count == 2,
              let fromString = Self.checkMovableRegex(components.first),
              let toString = Self.checkMovableRegex(components.last) else { return nil }
            
        return [fromString, toString]
    }
}

extension String {
    func firstString() -> String? {
        guard let char = self.first else { return nil }
        return String(char)
    }
    
    func lastString() -> String? {
        guard let char = self.last else { return nil }
        return String(char)
    }
}
