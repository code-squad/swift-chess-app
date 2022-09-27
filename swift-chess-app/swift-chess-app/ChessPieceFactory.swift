//
//  ChessPieceFactory.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

class ChessPieceFactory {
    static func create(chessPieceName: String, locations: [Location]) -> [ChessPiece]? {
        switch chessPieceName {
        case "WhitePawn":
            return locations.map { location in
                WhitePawn(location: location)
            }
            
        case "BlackPawn":
            return locations.map { location in
                BlackPawn(location: location)
            }
        default:
            return nil
        }
    }
}
