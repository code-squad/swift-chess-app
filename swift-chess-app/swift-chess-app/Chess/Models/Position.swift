//
//  Position.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

enum File: Int, CaseIterable {
    case a = 1, b, c, d, e, f, g, h
    
    var invertedTypeString: String {
        switch self {
        case .a:        return "A"
        case .b:        return "B"
        case .c:        return "C"
        case .d:        return "D"
        case .e:        return "E"
        case .f:        return "F"
        case .g:        return "G"
        case .h:        return "H"
        }
    }
    
    static func convert(from str: String) -> File? {
        return File.allCases.first(where: { $0.invertedTypeString == str })
    }
}

enum Rank: Int, CaseIterable {
    case one = 1, two, three, four, five, six, seven, eight
    
    var invertedTypeString: String {
        switch self {
        case .one:      return "1"
        case .two:      return "2"
        case .three:    return "3"
        case .four:     return "4"
        case .five:     return "5"
        case .six:      return "6"
        case .seven:    return "7"
        case .eight:    return "8"
        }
    }
    
    static func convert(from str: String) -> Rank? {
        return Rank.allCases.first(where: { $0.invertedTypeString == str })
    }
}

struct Position: CustomStringConvertible, Equatable {
    let file: File
    let rank: Rank
    
    var description: String {
        return "\(file.invertedTypeString)\(rank.invertedTypeString)"
    }
}
