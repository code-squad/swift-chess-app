//
//  Rank.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum Rank: Int, CaseIterable, Hashable {
    
    case one = 1, two, three, four, five, six, seven, eight
    
    var toString: String { String(rawValue) }
}

extension Rank {
    
    init?(_ num: Int) {
        guard let rank = Rank(rawValue: num) else { return nil }
        self = rank
    }
    
    init?(_ string: String) {
        guard let num = Int(string), let rank = Rank(rawValue: num) else { return nil }
        self = rank
    }
}

extension Rank: Equatable {
    
    static func == (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Rank {
    
    static func + (left: Rank, right: Rank) -> Rank? {
        return Rank(left.rawValue + right.rawValue)
    }
    
    static func + (left: Rank, right: Int) -> Rank? {
        return Rank(left.rawValue + right)
    }
    
    static func - (left: Rank, right: Rank) -> Rank? {
        return Rank(left.rawValue - right.rawValue)
    }
    
    static func - (left: Rank, right: Int) -> Rank? {
        return Rank(left.rawValue - right)
    }
}
