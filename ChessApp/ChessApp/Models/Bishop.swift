//
//  Bishop.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/04.
//

import Foundation

final class Bishop: Piece {

    var position: Position
    var iconString: String {
        user.bishopPolicy.iconString
    }
    var nextPossiblePositions: [Position] {
        let boundaryValue = min(Rank.Config.maxValue, File.Config.maxValue)

        let nextPossiblePositions: [Position] = (1...boundaryValue).map { int -> [Position] in
            return [Position(rank: Rank(self.position.rank.value + int), file: File(self.position.file.value + int)),
                    Position(rank: Rank(self.position.rank.value + int), file: File(self.position.file.value - int)),
                    Position(rank: Rank(self.position.rank.value - int), file: File(self.position.file.value + int)),
                    Position(rank: Rank(self.position.rank.value - int), file: File(self.position.file.value - int))]
                    .compactMap { $0 }
        }
        .flatMap { $0 }
        
        return nextPossiblePositions
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
