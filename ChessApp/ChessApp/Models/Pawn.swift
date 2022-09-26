//
//  Pawn.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/26.
//

import Foundation

protocol PawnDelegate: AnyObject {
    func didMovePawn(_ pawn: Pawn, prePosition: IndexPath)
}

final class Pawn {

    enum ColorType {
        case black
        case white
    }

    var postion: IndexPath
    let type: ColorType
    let iconString: String
    weak var delegate: PawnDelegate?
    var nextPossiblePositions: [IndexPath] {
        switch type {
        case .black:
            return [IndexPath(row: postion.row, section: postion.section + 1)]
        case .white:
            return [IndexPath(row: postion.row, section: postion.section - 1)]
        }

    }

    init(postion: IndexPath, type: ColorType) {
        self.postion = postion
        self.type = type
        switch type {
        case .black:
            self.iconString = "♟"
        case .white:
            self.iconString = "♙"
        }
    }

    func move(to postion: IndexPath) {
        let prePosition = self.postion
        self.postion = postion
        delegate?.didMovePawn(self, prePosition: prePosition)
    }

    func canMove(postion: IndexPath) -> Bool {
        return nextPossiblePositions.contains(postion)
    }
}
