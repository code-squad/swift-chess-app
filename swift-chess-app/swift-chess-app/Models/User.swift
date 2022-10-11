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
    
    var score: Int = 39
    
    let color: Color
    
    private(set) var state: UserState
    
    var pieces: [Piece] = []
    
    var toUserInfo: UserInfo { UserInfo(color: color, score: score) }
    
    init(
        id: String = UUID().uuidString,
        name: String,
        color: Color
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.state = .init()
    }
}

extension User {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.color == rhs.color
    }
}
