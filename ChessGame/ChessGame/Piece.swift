//
//  Piece.swift
//  ChessGame
//
//  Created by Delma Song on 2022/09/26.
//

import Foundation

struct Location {
    var file: File
    var rank: Rank
    
    enum File {
        case A, B, C, D, E, F, G, H
    }
    
    enum Rank {
        case one, two, three, four, five, six, seven, eight
    }
}

enum Color {
    case white, black
}

class Piece {
    var location: Location
    var color: Color
    var accessibleLocations: [Location]
    
    init(location: Location, color: Color, accessibleLocations: [Location] = []) {
        self.location = location
        self.color = color
        self.accessibleLocations = accessibleLocations
    }
}

final class Pawn: Piece {
    
}
