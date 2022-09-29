//
//  ChessProtocols.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

protocol ChessUnitProtocol {
    var type: ChessUnitType { get }
    var faction: PlayerFaction { get }
    func movablePaths(_ currentPosition: ChessPosition) -> [ChessPosition]
}
