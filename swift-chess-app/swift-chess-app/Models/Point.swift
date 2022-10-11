//
//  Point.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct Point: Hashable {
    
    let rank: Rank
    
    let file: File
    
    var toString: String { file.toString + rank.toString }
    
    var toTuple: Tuple { Tuple(row: rank.rawValue - 1, col: file.toInt) }
    
    static var zero: Point { Point(rank: .one, file: .a) }
}

extension Point {
    
    init?(string: String) {
        guard string.count == 2,
              let firstCharacter = string.first,
              let secondCharacter = string.last,
              let file = File(String(firstCharacter)),
              let rank = Rank(String(secondCharacter)) else { return nil }
        self.rank = rank
        self.file = file
    }
    
    init?(tuple: Tuple) {
        guard let rank = Rank(rawValue: tuple.row + 1), let file = File(tuple.col) else { return nil }
        self.rank = rank
        self.file = file
    }
}

extension Point: Equatable {
    
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.file == rhs.file && lhs.rank == rhs.rank
    }
}

extension Point {
    
    static func + (left: Point, right: Tuple) -> Point? {
        guard let rank = left.rank + right.row,
              let file = left.file + right.col else { return nil }
        return Point(rank: rank, file: file)
    }
    
    static func + (left: Point, right: Direction) -> Point? {
        let location = left.toTuple
        let vector = right.toTuple
        guard let rank = Rank(location.row + vector.row),
              let file = File(location.col + vector.col) else { return nil }
        return Point(rank: rank, file: file)
    }
    
    static func - (left: Point, right: Tuple) -> Point? {
        guard let rank = left.rank - right.row,
              let file = left.file - right.col else { return nil }
        return Point(rank: rank, file: file)
    }
    
    static func - (left: Point, right: Direction) -> Point? {
        let location = left.toTuple
        let vector = right.toTuple
        guard let rank = Rank(location.row - vector.row),
              let file = File(location.col - vector.col) else { return nil }
        return Point(rank: rank, file: file)
    }
}
