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

    /// 체스판의 열(Column)을 나타내는 타입.
    enum File: Int, BoardLocationRepresentable {
        case A = 1
        case B
        case C
        case D
        case E
        case F
        case G
        case H
    }

    /// 체스판의 행(Row)을 나타내는 타입.
    enum Rank: Int, BoardLocationRepresentable {
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
    }
}

extension Board.Location {

    /// 위치와 이동규칙을 더해 새로운 위치를 계산한다.
    /// - Parameters:
    ///   - lhs: 위치. 주로 현재 위치를 사용한다.
    ///   - rhs: 체스말의 이동 규칙.
    /// - Returns: 위치와 이동규칙으로부터 도출된 위치. 주로 도착점을 의미한다. 체스판 내부에 위치하지 않는 위치라면 `nil`을 반환한다.
    static func + (lhs: Self, rhs: MoveRule) -> Self? {
        guard let calculatedRank = Rank(rawValue: lhs.rank.rawValue + rhs.rank.extractedValue),
              let calculatedFile = File(rawValue: lhs.file.rawValue + rhs.file.extractedValue) else {
            return nil
        }
        return Self(file: calculatedFile, rank: calculatedRank)
    }

    /// 위치와 이동규칙의 차를 통해 새로운 위치를 계산한다.
    /// - Parameters:
    ///   - lhs: 위치. 주로 현재 위치를 사용한다.
    ///   - rhs: 체스말의 이동 규칙.
    /// - Returns: 위치와 이동규칙으로부터 도출된 위치. 주로 도착점을 의미한다. 체스판 내부에 위치하지 않는 위치라면 `nil`을 반환한다.
    static func - (lhs: Self, rhs: MoveRule) -> Self? {
        guard let calculatedRank = Rank(rawValue: lhs.rank.rawValue - rhs.rank.extractedValue),
              let calculatedFile = File(rawValue: lhs.file.rawValue - rhs.file.extractedValue) else {
            return nil
        }
        return Self(file: calculatedFile, rank: calculatedRank)
    }
}

extension Board.Location.Rank {

    /// ``Rank``와 이동규칙의 이동 단위를 더해 새로운 rank를 계산한다.
    /// - Parameters:
    ///   - lhs: Rank. 주로 현재 rank를 사용한다.
    ///   - rhs: 체스말 이동규칙의 이동 단위.
    /// - Returns: Rank와 이동 단위으로부터 도출된 새로운 Rank. 주로 도착 Rank을 의미한다. 체스판 내부에 존재하지 않는 Rank라면 `nil`을 반환한다.
    static func + (lhs: Self, rhs: MoveRule.Step) -> Self? {
        return Self(rawValue: lhs.rawValue + rhs.extractedValue)
    }

    /// ``Rank``와 이동규칙의 차를 통해 새로운 rank를 계산한다.
    /// - Parameters:
    ///   - lhs: Rank. 주로 현재 rank를 사용한다.
    ///   - rhs: 체스말 이동규칙의 이동 단위.
    /// - Returns: Rank와 이동 단위으로부터 도출된 새로운 Rank. 주로 도착 Rank을 의미한다. 체스판 내부에 존재하지 않는 Rank라면 `nil`을 반환한다.
    static func - (lhs: Self, rhs: MoveRule.Step) -> Self? {
        return Self(rawValue: lhs.rawValue - rhs.extractedValue)
    }
}

// MARK: - Protocol conformance

protocol BoardLocationRepresentable: Equatable, RawValueInitializable, RangedRawRepresentable {}

extension IndexRepresentable where Self: BoardLocationRepresentable, RawValue == Int {
    var index: Int {
        return self.rawValue - 1
    }
}

// MARK: - Board.Location.File

extension Board.Location.File: IndexRepresentable {}

extension Board.Location.File: AsciiValueRepresentable {
    var asciiValue: Int {
        return Board.Configuration.minimumFile.asciiValue + self.rawValue - 1
    }
}

// MARK: - Board.Location.Rank

extension Board.Location.Rank: IndexRepresentable {}
