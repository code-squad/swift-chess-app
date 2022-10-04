//
//  Queen.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/04.
//

import Foundation

final class Queen: Piece {

    var position: Position
    var iconString: String {
        user.queenPolicy.iconString
    }
    var nextPossiblePositions: [Position] {
        return []

    }
    let user: User
    let score: Int = 1

    init(position: Position, user: User) {
        self.position = position
        self.user = user
    }

    @discardableResult
    func move(to position: Position) -> Bool {
        guard nextPossiblePositions.contains(position) else { return false }

        self.position = position
        return true
    }
}
