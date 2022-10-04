//
//  Board+Location.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

/// 체스판 내 위치를 나타내는 타입.
struct BoardLocation: Equatable {
    /// 열(Column)
    var file: File
    /// 행(Row)
    var rank: Rank
}

extension BoardLocation {

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

extension BoardLocation {

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

// MARK: - Protocol conformance

protocol BoardLocationRepresentable: Equatable, RawValueInitializable, RangedRawRepresentable {}

extension IndexRepresentable where Self: BoardLocationRepresentable, RawValue == Int {
    var index: Int {
        return self.rawValue - 1
    }
}

// MARK: - BoardLocation.File

extension BoardLocation.File: IndexRepresentable {}

extension BoardLocation.File: AsciiValueRepresentable {
    var asciiValue: Int {
        return DefaultBoard.Configuration.minimumFile.asciiValue + self.rawValue - 1
    }
}

// MARK: - BoardLocation.Rank

extension BoardLocation.Rank: IndexRepresentable {}
