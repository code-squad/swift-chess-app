//
//  BoardTesting.swift
//  SwiftChessTests
//
//  Created by Geonhee on 2022/09/28.
//

@testable import SwiftChess

// swiftlint:disable comma
extension BoardTests {
    static let blackPawn = Pawn(color: .black)
    static let whitePawn = Pawn(color: .white)
    static let empty = Empty()
    static let emptyMock: [[BoardElementRepresentable]] = [
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
        [empty, empty, empty, empty, empty, empty, empty, empty],
    ]
    static let topLeftBlackPawnMock: [[BoardElementRepresentable]] = [
        [blackPawn, empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
    ]
    static let topLeftBlockedPawnsMock: [[BoardElementRepresentable]] = [
        [blackPawn, empty, empty, empty, empty, empty, empty, empty],
        [blackPawn, empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
    ]
    static let topLeftEngagedPawnsMock: [[BoardElementRepresentable]] = [
        [blackPawn, empty, empty, empty, empty, empty, empty, empty],
        [whitePawn, empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
    ]
    static let topLeftWhitePawnMock: [[BoardElementRepresentable]] = [
        [whitePawn, empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
        [empty    , empty, empty, empty, empty, empty, empty, empty],
    ]
}

extension Board.Location {
    static let A1 = Self(file: .A, rank: .one)
    static let A2 = Self(file: .A, rank: .two)
    static let A7 = Self(file: .A, rank: .seven)
    static let A8 = Self(file: .A, rank: .eight)
    static let B1 = Self(file: .B, rank: .one)
    static let D4 = Self(file: .D, rank: .four)
    static let D5 = Self(file: .D, rank: .five)
    static let G1 = Self(file: .G, rank: .one)
    static let G8 = Self(file: .G, rank: .eight)
    static let H1 = Self(file: .H, rank: .one)
    static let H7 = Self(file: .H, rank: .seven)
    static let H8 = Self(file: .H, rank: .eight)
}
// swiftlint:enable comma
