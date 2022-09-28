//
//  Piece.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

protocol Piece {
    /// 체스판에 존재할 수 있는 최대 개수
    static var maxCount: Int { get }

    var color: PieceColor { get }
}

enum PieceColor: CaseIterable {
    case black
    case white
}
