//
//  User.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class User: UserProtocol {
    
    let id: String
    
    let name: String
    
    let color: PieceColor
    
    private let inputManager: InputManager
    
    private(set) var state: UserState
    
    var pieces: [Piece] = []
    
    init(
        id: String = UUID().uuidString,
        name: String,
        color: PieceColor,
        inputManager: InputManager = .init()
    ) {
        self.color = color
        self.inputManager = inputManager
        self.state = .init()
        super.init(id: id, name: name)
    }
}

extension User {
    
    func doAction() -> Action {
        if let action = inputManager.enterCommand() {
            return action
        }
        return .unknown
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.color == rhs.color
    }
}
