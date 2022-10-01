//
//  File.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/02.
//

import Foundation

enum File: CaseIterable {
    case A
    case B
    case C
    case D
    case E
    case F
    case G
    case H

    init?(rawValue: Character?) {
        guard let rawValue = rawValue else { return nil }

        switch rawValue {
        case "A": self = .A
        case "B": self = .B
        case "C": self = .C
        case "D": self = .D
        case "E": self = .E
        case "F": self = .F
        case "G": self = .G
        case "H": self = .H
        default: return nil
        }
    }
}

extension File {

    var index: Int {
        switch self {
        case .A:
            return 0
        case .B:
            return 1
        case .C:
            return 2
        case .D:
            return 3
        case .E:
            return 4
        case .F:
            return 5
        case .G:
            return 6
        case .H:
            return 7
        }
    }

    var right: Self? {
        switch self {
        case .A:
            return .B
        case .B:
            return .C
        case .C:
            return .D
        case .D:
            return .E
        case .E:
            return .F
        case .F:
            return .G
        case .G:
            return .H
        case .H:
            return nil
        }
    }

    var left: Self? {
        switch self {
        case .A:
            return nil
        case .B:
            return .A
        case .C:
            return .B
        case .D:
            return .C
        case .E:
            return .D
        case .F:
            return .E
        case .G:
            return .F
        case .H:
            return .G
        }
    }

    var toString: String {
        switch self {
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        case .D:
            return "D"
        case .E:
            return "E"
        case .F:
            return "F"
        case .G:
            return "G"
        case .H:
            return "H"
        }
    }
}
