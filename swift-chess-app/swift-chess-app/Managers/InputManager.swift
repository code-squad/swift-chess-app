//
//  InputManager.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class InputManager: UserControllable {
    
    let parser: Parser
    
    init(parser: Parser = Parser()) {
        self.parser = parser
    }
    
    func enterCommand() -> Action? {
        print("명령을 입력하세요> ")
        guard let command = readLine() else { return nil }
        return parser.parse(command: command)
    }
}
