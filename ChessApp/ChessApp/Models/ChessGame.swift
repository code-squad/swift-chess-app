//
//  ChessGame.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/27.
//

import Foundation

final class ChessGame {

    let board = Board()
    private let users: [User]
    // 추후 이곳에서 흑백 순서와, 명령어 처리를 담당합니다

    init(users: [User]) {
        self.users = users
        reset()
    }
    
    func reset() {
        board.clearAll()
        users.forEach { user in
            board.resetPiece(user: user)
        }
    }
}
