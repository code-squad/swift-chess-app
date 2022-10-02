//
//  Board+Location.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

extension Board {

    /// 체스판 내 위치를 나타내는 타입.
    struct Location: Equatable {
        /// 열(Column)
        var file: File
        /// 행(Row)
        var rank: Rank
    }
}

extension Board.Location {

    enum Rank: Int, Equatable, RawValueInitializable, RangedRawRepresentable {
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
    }

    enum File: Int, Equatable, RawValueInitializable, RangedRawRepresentable {
        case A = 1
        case B
        case C
        case D
        case E
        case F
        case G
        case H
    }
}

extension Board.Location {

    static func + (lhs: Self, rhs: MoveRule) -> Self? {
        guard let calculatedRank = Rank(rawValue: lhs.rank.rawValue + rhs.rank.extractedValue),
              let calculatedFile = File(rawValue: lhs.file.rawValue + rhs.file.extractedValue) else {
            return nil
        }
        return Self(file: calculatedFile, rank: calculatedRank)
    }

    static func - (lhs: Self, rhs: MoveRule) -> Self? {
        guard let calculatedRank = Rank(rawValue: lhs.rank.rawValue - rhs.rank.extractedValue),
              let calculatedFile = File(rawValue: lhs.file.rawValue - rhs.file.extractedValue) else {
            return nil
        }
        return Self(file: calculatedFile, rank: calculatedRank)
    }
}

extension Board.Location.File: IndexRepresentable {}
extension Board.Location.Rank: IndexRepresentable {}

extension Board.Location.File: AsciiValueRepresentable {
    var asciiValue: Int {
        return Board.Configuration.minimumFile.asciiValue + self.rawValue - 1
    }
}

extension Board.Location.Rank {
    static func + (lhs: Self, rhs: MoveRule.Step) -> Self? {
        return Self(rawValue: lhs.rawValue + rhs.extractedValue)
    }

    static func - (lhs: Self, rhs: MoveRule.Step) -> Self? {
        return Self(rawValue: lhs.rawValue - rhs.extractedValue)
    }
}
