//
//  Pawn.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

protocol ChessPiece {
    var location: Location? { get }
    var rechableLocations: [Location]? { get }
    var isWhite: Bool { get }
    func move(to: Location) -> Bool
    func located(atRank rank: Int) -> Bool
}

class WhitePawn: ChessPiece {
    private(set) var location: Location?
    var rechableLocations: [Location]? {
        guard var location = location else {
            return nil
        }
        
        return [
            location.minusRank(1),
            location.plusFile(1),
            location.minusFile(1)
        ]
    }
    
    var isWhite: Bool { true }
    
    init(location: Location?) {
        self.location = location
    }
    
    func move(to destination: Location) -> Bool {
        guard let rechableLocations = rechableLocations else {
            return false
        }
        
        if rechableLocations.contains(destination) {
            self.location = destination
            return true
        }
        
        return false
    }
    
    func located(atRank rank: Int) -> Bool {
        guard let location = location else {
            return false
        }
        return location.isRank(rank)
    }
}

class BlackPawn: ChessPiece {
    private(set) var location: Location?
    var rechableLocations: [Location]? {
        guard var location = location else {
            return nil
        }
        return [
            location.plusRank(1),
            location.plusFile(1),
            location.minusFile(1)
        ]
    }
    
    var isWhite: Bool { false }
    
    init(location: Location?) {
        self.location = location
    }
    
    func move(to destination: Location) -> Bool {
        guard let rechableLocations = rechableLocations else {
            return false
        }
        
        if rechableLocations.contains(destination) {
            self.location = destination
            return true
        }
        
        return false
    }
    
    func located(atRank rank: Int) -> Bool {
        guard let location = location else {
            return false
        }
        return location.isRank(rank)
    }
}
