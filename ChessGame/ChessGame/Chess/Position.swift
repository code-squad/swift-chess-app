//
//  Position.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import Foundation

struct Position: Equatable, Hashable {
    /// 세로 (column에 해당) 알파벳 표기
    var file: Int
    /// 가로 (row에 해당) 숫자 표기
    var rank: Int
}

typealias Delta = Position

extension Delta {
    static func -(lhs: Position, rhs: Position) -> Delta {
        var lhs = lhs
        lhs.file -= rhs.file
        lhs.rank -= rhs.rank
        return lhs
    }
}

extension Position {
    static func +(lhs: Position, rhs: Delta) -> Position {
        var lhs = lhs
        lhs.file += rhs.file
        lhs.rank += rhs.rank
        return lhs
    }
}
