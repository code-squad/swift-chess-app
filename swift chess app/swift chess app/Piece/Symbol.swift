//
//  Symbol.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

enum Symbol {
    case pawn(PieceColor)
    case empty
    
    var image: String {
        switch self {
        case .pawn(let color): return color == .black ? "♟" : "♙"
        case .empty: return "."
        }
    }
    
    var rawValue: String {
        switch self {
        case .pawn:     return "pawn"
        default:        return "empty"
        }
    }
    
    init(name: String, color: PieceColor) {
        switch name {
        case Self.pawn(color).rawValue: self = .pawn(color)
        default: self = .empty
        }
    }
}
