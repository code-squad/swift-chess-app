//
//  Board.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/09/28.
//

final class Board {

    private var status: [[Piece?]] = []
}

extension Board {

    enum Configuration {
        static let size = Board.Size(rank: 8, file: 8)
    }

    struct Size {
        let rank: Int
        let file: Int
    }

    struct Location {
        var rank: Int
        var file: Int
    }
}
