//
//  ChessRank.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct ChessRank: Hashable {
    
    let num: Int
    
    var toString: String { String(num) }
    
    static let allCases: ClosedRange<Int> = (1...8)
    
    private init(num: Int) {
        self.num = num
    }
}

extension ChessRank {
    
    init?(_ num: Int) {
        guard num >= 1 && num <= 8 else { return nil}
        self.num = num
    }
    
    init?(_ string: String) {
        guard let num = Int(string), num >= 1 && num <= 8 else { return nil }
        self.num = num
    }
}

extension ChessRank: Equatable {
    
    static func == (lhs: ChessRank, rhs: ChessRank) -> Bool {
        return lhs.num == rhs.num
    }
}

extension ChessRank {
    
    static func + (left: ChessRank, right: ChessRank) -> ChessRank {
        return ChessRank(num: left.num + right.num)
    }
    
    static func + (left: ChessRank, right: Int) -> ChessRank {
        return ChessRank(num: left.num + right)
    }
    
    static func - (left: ChessRank, right: ChessRank) -> ChessRank {
        return ChessRank(num: left.num - right.num)
    }
    
    static func - (left: ChessRank, right: Int) -> ChessRank {
        return ChessRank(num: left.num - right)
    }
}
