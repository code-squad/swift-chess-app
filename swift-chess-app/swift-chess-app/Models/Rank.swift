//
//  Rank.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct Rank: Hashable {
    
    let num: Int
    
    var toString: String { String(num) }
    
    static let allCases: ClosedRange<Int> = (1...8)
    
    private init(num: Int) {
        self.num = num
    }
}

extension Rank {
    
    init?(_ num: Int) {
        guard num >= 1 && num <= 8 else { return nil}
        self.num = num
    }
    
    init?(_ string: String) {
        guard let num = Int(string), num >= 1 && num <= 8 else { return nil }
        self.num = num
    }
}

extension Rank: Equatable {
    
    static func == (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.num == rhs.num
    }
}

extension Rank {
    
    static func + (left: Rank, right: Rank) -> Rank {
        return Rank(num: left.num + right.num)
    }
    
    static func + (left: Rank, right: Int) -> Rank {
        return Rank(num: left.num + right)
    }
    
    static func - (left: Rank, right: Rank) -> Rank {
        return Rank(num: left.num - right.num)
    }
    
    static func - (left: Rank, right: Int) -> Rank {
        return Rank(num: left.num - right)
    }
}
