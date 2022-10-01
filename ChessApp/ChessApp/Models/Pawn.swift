//
//  Pawn.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/26.
//

import Foundation

final class Pawn: Piece {

    enum ColorType {
        case black
        case white
    }

    var position: Position
    let type: ColorType
    let iconString: String
    
    var nextPossiblePositions: [Position] {
        switch type {
        case .black:
            return [Position(rank: position.rank, file: File(position.file.value + 1))]
                .compactMap { $0 }
        case .white:
            return [Position(rank: position.rank, file: File(position.file.value - 1))]
                .compactMap { $0 }
        }

    }

    init(position: Position, type: ColorType) {
        self.position = position
        self.type = type
        switch type {
        case .black:
            self.iconString = "♟"
        case .white:
            self.iconString = "♙"
        }
    }

    func move(to position: Position) {
        self.position = position
    }

    func canMove(position: Position) -> Bool {
        return nextPossiblePositions.contains(position)
    }
}
