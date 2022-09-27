//
//  Pawn.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

protocol Pawn {
    var location: Location { get }
    var rechableLocations: [Location] { get }
    func move(to: Location) -> Bool
}

class WhitePawn: Pawn {
    private(set) var location: Location
    var rechableLocations: [Location] {
        [
            location.minusRank(1),
            location.plusFile(1),
            location.minusFile(1)
        ]
    }
    
    init(location: Location) {
        self.location = location
    }
    
    func move(to destination: Location) -> Bool {
        if rechableLocations.contains(destination) {
            self.location = destination
            return true
        }
        
        return false
    }
}

class BlackPawn: Pawn {
    private(set) var location: Location
    var rechableLocations: [Location] {
        [
            location.plusRank(1),
            location.plusFile(1),
            location.minusFile(1)
        ]
    }
    
    init(location: Location) {
        self.location = location
    }
    
    func move(to destination: Location) -> Bool {
        if rechableLocations.contains(destination) {
            self.location = destination
            return true
        }
        
        return false
    }
}
