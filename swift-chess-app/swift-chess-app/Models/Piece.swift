//
//  Piece.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/02.
//

import Foundation

class Piece {
    
    let color: Color
    
    var point: Point
    
    var score: Int { 0 }
    
    var steps: [Tuple] { [] }
    
    var maxStepDistance: Int { 1 }
    
    var toString: String { "" }
    
    var toIcon: String { "" }
    
    init(color: Color, point: Point) {
        self.color = color
        self.point = point
    }
}

extension Piece: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
        hasher.combine(point)
        hasher.combine(score)
    }
    
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

extension Piece {
    
    enum Color {
        
        case white, black
        
        var toKorean: String {
            switch self {
            case .white: return "백색"
            case .black: return "흑색"
            }
        }
    }
}
