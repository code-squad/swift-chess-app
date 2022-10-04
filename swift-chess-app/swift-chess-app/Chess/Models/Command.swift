//
//  Command.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

struct Command {
    let fromString: String
    let toString: String
    
    func fromPosition() -> Position? {
        guard let fileString = fromString.firstString(),
              let rankString = fromString.lastString(),
              let file = File(rawValue: fileString),
              let rank = Rank(rawValue: rankString) else { return nil }
        
        return Position(file: file, rank: rank)
    }
    
    func toPosition() -> Position? {
        guard let fileString = toString.firstString(),
              let rankString = toString.lastString(),
              let file = File(rawValue: fileString),
              let rank = Rank(rawValue: rankString) else { return nil }
        
        return Position(file: file, rank: rank)
    }
}

extension Command {
    static func make(inputString: String) -> Command? {
        let components = inputString.components(separatedBy: "->")
        
        guard components.count == 2,
              let fromString = Self.checkRegex(components.first),
              let toString = Self.checkRegex(components.last) else { return nil }
            
        return Command(fromString: fromString, toString: toString)
    }
    
    static private func checkRegex(_ str: String?) -> String? {
        guard let str = str else { return nil }
        
        let pattern: String = "[A-H][1-8]$"
        if str.range(of: pattern, options: .regularExpression) != nil {
            return str
        } else {
            return nil
        }
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
