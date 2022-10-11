//
//  Position.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

struct Position: Hashable {
    enum Rank: Int, CaseIterable, Strideable {
        typealias Stride = Int
        case one = 1, two, three, four, five, six, seven, eight

        static let minCoordinate: Int = Rank.one.coordinate
        static let maxCoordinate: Int = Rank.eight.coordinate

        var coordinate: Int { self.rawValue }

        init?(value: String) {
            switch value {
            case "1": self = .one
            case "2": self = .two
            case "3": self = .three
            case "4": self = .four
            case "5": self = .five
            case "6": self = .six
            case "7": self = .seven
            case "8": self = .eight
            default: return nil
            }
        }

        func distance(to other: Rank) -> Int {
            other.rawValue - self.rawValue
        }

        func advanced(by n: Int) -> Rank {
            Rank(rawValue: self.rawValue + n) ?? (n > 0 ? .eight : .one)
        }
    }

    enum File: Int, CaseIterable, Strideable {
        typealias Stride = Int

        case A = 1, B, C, D, E, F, G, H

        static let minCoordinate: Int = File.A.coordinate
        static let maxCoordinate: Int = File.H.coordinate

        var coordinate: Int { self.rawValue }

        init?(value: String) {
            switch value {
            case "A": self = .A
            case "B": self = .B
            case "C": self = .C
            case "D": self = .D
            case "E": self = .E
            case "F": self = .F
            case "G": self = .G
            case "H": self = .H
            default: return nil
            }
        }

        func distance(to other: File) -> Int {
            other.rawValue - self.rawValue
        }

        func advanced(by n: Int) -> File {
            File(rawValue: self.rawValue + n) ?? (n > 0 ? .H : .A)
        }
    }

    let x: File
    let y: Rank
}
