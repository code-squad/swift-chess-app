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
    
    enum Rank: Int {
        case one = 1, two, three, four, five, six, seven, eight
    }
}

enum Color {
    case white, black
}

class Piece {
    var location: Location
    let color: Color
    var accessibleLocations: [Location]
    
    init(location: Location, color: Color, accessibleLocations: [Location] = []) {
        self.location = location
        self.color = color
        self.accessibleLocations = accessibleLocations
    }
}

final class Pawn: Piece {
    private var movableDistance: Int = 1
    // 초기 생성시 흑색은 2rank, 백색은 7rank에만 생성됨
    
    func move(from: Location, to: Location) {
        let distance = from.rank.rawValue - to.rank.rawValue
        
        if (color == .black && distance == -1) || (color == .white && distance == 1) {
            location = to
        }
    }
}
