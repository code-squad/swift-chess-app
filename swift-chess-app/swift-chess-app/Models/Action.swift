//
//  Action.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum Action {
    
    case move(from: Point, to: Point)
    
    case capture(_ point: Point, by: Point)
    
    case giveUp
    
    case error(_ error: ChessError)
    
    case unknown
}
