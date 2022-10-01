//
//  Position.swift
//  ChessApp
//
//  Created by 최동규 on 2022/10/01.
//

import Foundation

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
