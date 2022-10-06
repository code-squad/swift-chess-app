//
//  main.swift
//  ChessGamePair
//
//  Created by USER on 2022/10/06.
//

import Foundation

protocol Piece {
    var color: String { get }
    var currentLocation: Location? { get set }
    var initialLocation: Location { get }
    
    func movableLocations() -> [Location]
    mutating func create()
}

struct Location: Equatable {
    var file: String
    var rank: Int
}

protocol King: Piece { }

extension King {
    // TODO: - empty
    func movableLocations() -> [Location] {
        return []
    }
}

struct WhiteKing: King {
    let color: String = "white"
    var currentLocation: Location?
    var initialLocation: Location = .init(file: "D", rank: 8)
    
    mutating func create() {
        currentLocation = initialLocation
    }
}

struct BlackKing: King {
    let color: String = "black"
    var currentLocation: Location?
    var initialLocation: Location = .init(file: "D", rank: 1)
    
    mutating func create() {
        currentLocation = initialLocation
    }
}
