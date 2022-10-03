//
//  User.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class User: UserInformable, Equatable {
    
    let id: String
    
    let name: String
    
    let color: Piece.Color
    
    private let controller: UserControllable
    
    private(set) var state: UserState
    
    var pieces: [Piece] = []
    
    init(
        id: String = UUID().uuidString,
        name: String,
        color: Piece.Color,
        controller: UserControllable
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.controller = controller
        self.state = .init()
    }
}

extension User {
    
    func doAction() -> Action {
        if let action = controller.enterCommand() {
            return action
        }
        return .unknown
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.color == rhs.color
    }
}
