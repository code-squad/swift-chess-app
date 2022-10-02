//
//  Parser.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class Parser {
    
    func parse(command: String) -> Action? {
        
        if command.contains("->") {
            let results = command.components(separatedBy: "->")
            guard results.count == 2,
                  let string1 = results.first,
                  let string2 = results.last,
                  let point1 = Point(string: string1),
                  let point2 = Point(string: string2) else { return nil }
            return .move(from: point1, to: point2)
        }
        
        return nil
    }
}
