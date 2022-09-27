//
//  InputManager.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class InputManager {
    
    let parser: Parser
    
    init(parser: Parser = Parser()) {
        self.parser = parser
    }
    
    func enterCommand() -> ChessAction? {
        print("명령을 입력하세요> ")
        guard let command = readLine() else { return nil }
        return parser.parse(command: command)
    }
}
