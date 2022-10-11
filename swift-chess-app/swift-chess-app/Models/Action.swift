//
//  Action.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum Action {
    
    case help(_ point: Point)
    
    case cancel
    
    case move(from: Point, to: Point)
    
    case capture(_ point1: Point, _ point2: Point)
    
    case giveUp
    
    case error(_ error: ChessError)
    
    case unknown
}
