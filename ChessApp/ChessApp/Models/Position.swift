//
//  Position.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/01.
//

import Foundation

//enum RankError: LocalizedError {
//    case outOfRange(value: Int)
//
//    var errorDescription: String {
//        switch self {
//        case .outOfRange(let value):
//            return "out of range \(value), minValue is \(Rank.Config.minValue) and maxValue is \(Rank.Config.maxValue)"
//        }
//    }
//}
//
//enum FileError: LocalizedError {
//    case outOfRange(value: Int)
//
//    var errorDescription: String {
//        switch self {
//        case .outOfRange(let file):
//            return "out of range \(value), minValue is \(File.Config.minValue) and maxValue is \(File.Config.maxValue)"
//        }
//    }
//}

struct Position: Equatable {

    let rank: Rank
    let file: File

    init? (rank: Rank?, file: File?) {
        guard let rank = rank,
              let file = file else {
            return nil
        }
        self.rank = rank
        self.file = file

    }
}

struct Rank: Equatable {

    enum Config {
        static var minValue: Int = 0
        static var maxValue: Int = 7
        static var size: Int {
            return maxValue - minValue + 1
        }
    }

    var valueName: String {
        return String(value + 1)
    }
    let value: Int

    init? (_ value : Int) {
        guard (Config.minValue...Config.maxValue).contains(value) else { return nil
        }
        self.value = value
    }
}

struct File: Equatable {

    enum Config {
        static var minValue: Int = 0
        static var maxValue: Int = 7
        static var size: Int {
            return maxValue - minValue + 1
        }
    }

    var valueName: String {
        guard let ascii =  UnicodeScalar(value + 65) else {
            return "?"
        }
        return String(ascii)
    }
    let value: Int

    init? (_ value : Int) {
        guard (Config.minValue...Config.maxValue).contains(value) else { return nil
        }
        self.value = value
    }
}
