//
//  File.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum File: String, CaseIterable, Hashable  {
    
    case a, b, c, d, e, f, g, h
    
    var toString: String { self.rawValue.uppercased() }
    
    var toInt: Int {
        for (idx, file) in File.allCases.enumerated() where file == self {
            return idx
        }
        return 0
    }
}

extension File {
    
    init?(_ string: String) {
        let lowerString = string.lowercased()
        guard let file = File(rawValue: lowerString) else { return nil }
        self = file
    }
}

extension File: Equatable {
    
    static func == (lhs: File, rhs: File) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
