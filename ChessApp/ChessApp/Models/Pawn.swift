//
//  Pawn.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/26.
//

import Foundation

protocol PawnDelegate: AnyObject {
    func didMovePawn(_ pawn: Pawn, position: IndexPath)
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
    var nextPossiblePosition: IndexPath {
        switch type {
        case .black:
            return IndexPath(row: postion.row + 1, section: postion.section)
        case .white:
            return IndexPath(row: postion.row - 1, section: postion.section)
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
        self.postion = postion
        delegate?.didMovePawn(self, position: postion)
    }

    func canMove(postion: IndexPath) -> Bool {
        return postion == nextPossiblePosition
    }
}
