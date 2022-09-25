//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

class ChessBoard {
    enum Dimension {
        enum Size {
            static let rank: Int = 8
            static let file: Int = 8
        }
    }
    
    var matrix: [[Bool]]
    
    init() {
        let rank: [Bool] = Array(repeating: false, count: Dimension.Size.rank)
        self.matrix = Array(repeating: rank, count: Dimension.Size.file)
    }
}
