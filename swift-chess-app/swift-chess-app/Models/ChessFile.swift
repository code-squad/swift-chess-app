//
//  ChessFile.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum ChessFile: String, CaseIterable, Hashable  {
    
    case a, b, c, d, e, f, g, h
    
    var toString: String { self.rawValue.uppercased() }
    
    var toInt: Int {
        for (idx, file) in ChessFile.allCases.enumerated() where file == self {
            return idx
        }
        return 0
    }
}

extension ChessFile {
    
    init?(_ string: String) {
        let lowerString = string.lowercased()
        guard let file = ChessFile(rawValue: lowerString) else { return nil }
        self = file
    }
}

extension ChessFile: Equatable {
    
    static func == (lhs: ChessFile, rhs: ChessFile) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
