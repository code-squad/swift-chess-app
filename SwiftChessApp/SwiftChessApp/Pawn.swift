//
//  Pawn.swift
//  SwiftChessApp
//
//  Created by YoungsunMoon on 2022/09/29.
//

import Foundation

extension Pawn {
    enum Color {
        case black
        case white
        
        var description: String {
            switch self {
            case .black:
                return "♟"
            case .white:
                return "♙"
            }
        }
    }
}

struct Pawn {
    let color: Color
    
    init?(color: Color?) {
        guard let color else { return nil }
        self.color = color
    }
}

