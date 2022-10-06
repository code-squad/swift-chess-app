//
//  main.swift
//  Pair01a
//
//  Created by 김상진 on 2022/10/06.
//

import Foundation

class Position: Equatable {

    enum Rank: Int, Strideable {
        typealias Stride = Int

        case one, two, three, four, five, six, seven, eight

        func advanced(by n: Int) -> Position.Rank {
            return Rank(rawValue: numericCast(Stride(self.rawValue) + n))!
        }

        func distance(to other: Position.Rank) -> Int {
            return Stride(other.rawValue) - Stride(self.rawValue)
        }
    }

    enum File: Int, Strideable {
        typealias Stride = Int

        case a, b, c, d, e, f, g, h
        
        func advanced(by n: Int) -> Position.File {
            return File(rawValue: numericCast(Stride(self.rawValue) + n))!
        }

        func distance(to other: Position.File) -> Int {
            return Stride(other.rawValue) - Stride(self.rawValue)
        }
    }
    
    var rank: Rank
    var file: File
    
    init(rank: Rank, file: File) {
        self.rank = rank
        self.file = file
    }
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.file == rhs.file && lhs.rank == rhs.rank
    }
}

enum Color {
    
    case white
    case black
}
