//
//  Location.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

//struct UpperAlphabets {
//    private static let startChar = Unicode.Scalar("A").value
//    private static let endChar = Unicode.Scalar("Z").value
//    private static var alphabets: [String] = .init()
//    private static var value: [String] {
//        if alphabets.isEmpty {
//            alphabets = (startChar...endChar).map { alphabet in
//                String(alphabet)
//            }
//        }
//        return alphabets
//    }
//
//    static func index(_ alphabet: UpperAlphabet) -> Int? {
//        value.firstIndex(of: alphabet.value)
//    }
//
//    static func contains(_ alphabet: String) -> Bool {
//        value.contains(alphabet)
//    }
//
//    static func alphabet(at index: Int) -> UpperAlphabet? {
//        if value.indices.contains(index) {
//            return value[index]
//        }
//        return nil
//    }
//}

//struct UpperAlphabet {
//    let value: String
//
//    init?(value: String) {
//        if UpperAlphabets.contains(value) {
//            return nil
//        }
//        self.value = value
//    }
//}

struct Location: Equatable {
    private(set) var rank: Int
    private(set) var file: Int
    
    func distance(between location: Location) -> Int {
        return abs(rank - location.rank) + abs(file - location.file)
    }
    
    mutating func plusRank(_ value: Int) -> Location {
        .init(rank: rank + 1, file: file)
    }
    
    mutating func plusFile(_ value: Int) -> Location {
        .init(rank: rank, file: file + 1)
    }
    
    mutating func minusRank(_ value: Int) -> Location {
        .init(rank: rank - 1, file: file)
    }
    
    mutating func minusFile(_ value: Int) -> Location {
        .init(rank: rank, file: file - 1)
    }
}
