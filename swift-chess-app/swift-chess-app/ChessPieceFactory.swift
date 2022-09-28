//
//  ChessPieceFactory.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

class ChessPieceFactory {
    enum Error: LocalizedError {
        case unknownChessPiece
        
        var errorDescription: String? {
            switch self {
            case .unknownChessPiece:
                return "unknown chess piece"
            }
        }
    }
    static func create(chessPieceName: String, locations: [Location]) throws -> [ChessPiece] {
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
            throw Error.unknownChessPiece
        }
    }
}
