//
//  ChessUser.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class ChessUser: User, ChessUserProtocol {
    
    let color: ChessPieceColor
    
    private let inputManager: InputManager
    
    private(set) var state: ChessUserState
    
    var pieces: [ChessPiece] = []
    
    init(
        id: String = UUID().uuidString,
        name: String,
        color: ChessPieceColor,
        inputManager: InputManager = .init()
    ) {
        self.color = color
        self.inputManager = inputManager
        self.state = .init()
        super.init(id: id, name: name)
    }
}

extension ChessUser {
    
    func doAction() -> ChessAction {
        if let action = inputManager.enterCommand() {
            return action
        }
        return .unknown
    }
    
    static func == (lhs: ChessUser, rhs: ChessUser) -> Bool {
        return lhs.id == rhs.id && lhs.color == rhs.color
    }
}
