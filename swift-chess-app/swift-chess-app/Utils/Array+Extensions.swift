//
//  Array+Extensions.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/04.
//

import UIKit

extension Array where Element == Point {
    
    var sortedByFile: [Element] {
        return sorted { lhs, rhs in
            if lhs.file.rawValue == rhs.file.rawValue {
                return lhs.rank.rawValue <= rhs.rank.rawValue
            }
            return lhs.file.rawValue < rhs.file.rawValue
        }
    }
}

extension Array where Element == (Point, UIButton) {
    
    var sortedByRank: [Element] {
        return sorted { lhs, rhs in
            if lhs.0.rank.rawValue == rhs.0.rank.rawValue {
                return lhs.0.file.rawValue <= rhs.0.file.rawValue
            }
            return lhs.0.rank.rawValue < rhs.0.rank.rawValue
        }
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
