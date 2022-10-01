//
//  Rank.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/02.
//

import Foundation

enum Rank: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight

    init?(str: Character?) {
        guard let str = str else { return nil }

        switch str {
        case "1": self = .one
        case "2": self = .two
        case "3": self = .three
        case "4": self = .four
        case "5": self = .five
        case "6": self = .six
        case "7": self = .seven
        case "8": self = .eight
        default: return nil
        }
    }
}

extension Rank {

    var index: Int {
        switch self {
        case .one:
            return 0
        case .two:
            return 1
        case .three:
            return 2
        case .four:
            return 3
        case .five:
            return 4
        case .six:
            return 5
        case .seven:
            return 6
        case .eight:
            return 7
        }
    }

    var bottom: Self? {
        switch self {
        case .one:
            return .two
        case .two:
            return .three
        case .three:
            return .four
        case .four:
            return .five
        case .five:
            return .six
        case .six:
            return .seven
        case .seven:
            return .eight
        case .eight:
            return nil
        }
    }

    var top: Self? {
        switch self {
        case .one:
            return nil
        case .two:
            return .one
        case .three:
            return .two
        case .four:
            return .three
        case .five:
            return .four
        case .six:
            return .five
        case .seven:
            return .six
        case .eight:
            return .seven
        }
    }

    var toString: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        }
    }
}
