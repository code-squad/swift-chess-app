//
//  Pawn.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

struct Pawn {
    enum Color {
        case white, black
    }
    
    let id: UUID
    let color: Color
    var position: Position
    
    init(color: Color, position: Position) {
        self.id = UUID()
        self.color = color
        self.position = position
    }
    
    mutating func move(_ position: Position) {
        self.position = position
    }
}

