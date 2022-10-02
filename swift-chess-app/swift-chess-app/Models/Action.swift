//
//  Action.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum Action {
    
    case move(from: Point, to: Point)
    
    case capture(_ piece: Piece, by: Piece)
    
    case giveUp
    
    case unknown
}
