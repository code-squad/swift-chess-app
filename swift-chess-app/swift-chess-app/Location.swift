//
//  Location.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

struct UpperAlphabets {
    private static let startChar = Unicode.Scalar("A").value
    private static let endChar = Unicode.Scalar("Z").value
    private static var alphabets: [String] = .init()
    private static var value: [String] {
        if alphabets.isEmpty {
            alphabets = (startChar...endChar).map { alphabet in
                String(Character(UnicodeScalar(alphabet)!))
            }
        }
        return alphabets
    }

    static func index(_ alphabet: UpperAlphabet) -> Int? {
        value.firstIndex(of: alphabet.value)
    }

    static func contains(_ alphabet: String) -> Bool {
        value.contains(alphabet)
    }
}

struct UpperAlphabet {
    let value: String

    init?(value: String) {
        guard UpperAlphabets.contains(value) else {
            return nil
        }
        self.value = value
    }
}

struct Location: Equatable {
    private(set) var rank: Int
    private(set) var file: Int
    
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
    
    func isRank(_ rank: Int) -> Bool {
        self.rank == rank
    }
}
