//
//  GamePoint.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

struct GamePoint: Equatable {
    var black: Int
    var white: Int
}

extension GamePoint {
    static let zeros = Self(black: 0, white: 0)
}
