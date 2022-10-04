//
//  Dimension.swift
//  swift-chess-app
//
//  Created by USER on 2022/10/03.
//

import Foundation

enum Dimension {
    enum Board {
        static let boardWidth = 8
        static let boardHeight = 8
    }
    
    enum Point {
        static let pawn = 1
        static let bishop = 3
        static let knight = 3
        static let rook = 5
        static let queen = 9
    }
}
