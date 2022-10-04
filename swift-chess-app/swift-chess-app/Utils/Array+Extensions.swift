//
//  Array+Extensions.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/04.
//

import Foundation

extension Array where Element == Point {
    
    var sortedByFile: [Point] {
        return self.sorted { lhs, rhs in
            if lhs.file.rawValue == rhs.file.rawValue {
                return lhs.rank.rawValue < rhs.rank.rawValue
            }
            return lhs.file.rawValue < rhs.file.rawValue
        }
    }
}
