//
//  Position.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/28.
//

import Foundation

struct Position {
    let file: File
    let rank: Rank
    
    init(file: File, rank: Rank) {
        self.rank = rank
        self.file = file
    }
}

extension Position {
    enum File: Int, CaseIterable {
        case A = 0
        case B,C,D,E,F,G,H
    }

    enum Rank: Int, CaseIterable {
        case one = 0
        case two, three, four, five, six, seven, eight
    }
}
