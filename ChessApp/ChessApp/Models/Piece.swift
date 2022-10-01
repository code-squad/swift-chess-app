//
//  Piece.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/01.
//

import Foundation

protocol Piece {
    var iconString: String { get }
    var position: Position { get }
}
