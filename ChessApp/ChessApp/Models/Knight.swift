//
//  Knight.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/04.
//

import Foundation

final class Knight: Piece {

    var position: Position
    var iconString: String {
        user.knightPolicy.iconString
    }
    var nextPossiblePositions: [Position] {
        return [Position(rank: Rank(self.position.rank.value + 1), file: File(self.position.file.value + 2)),
                Position(rank: Rank(self.position.rank.value + 1), file: File(self.position.file.value - 2)),
                Position(rank: Rank(self.position.rank.value - 1), file: File(self.position.file.value + 2)),
                Position(rank: Rank(self.position.rank.value - 1), file: File(self.position.file.value - 2)),
                Position(rank: Rank(self.position.rank.value + 2), file: File(self.position.file.value + 1)),
                Position(rank: Rank(self.position.rank.value + 2), file: File(self.position.file.value - 1)),
                Position(rank: Rank(self.position.rank.value - 2), file: File(self.position.file.value + 1)),
                Position(rank: Rank(self.position.rank.value - 2), file: File(self.position.file.value - 1))]
                .compactMap { $0 }
    }
    let user: User
    let score: Int = 3

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
