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
    
    func fromPosition() -> Position {
        return Position(file: .one, rank: .a)
    }
    
    func toPosition() -> Position {
        return Position(file: .eight, rank: .a)
    }
}

extension Command {
    static func make(inputString: String) -> Command? {
        let components = inputString.components(separatedBy: "->")
        
        guard components.count == 2,
              let fromString = components.first,
              let toString = components.last else { return nil }
        
        // TODO: - 정규 표현식으로 입력 범위 확인하기
        return Command(fromString: fromString, toString: toString)
    }
}
