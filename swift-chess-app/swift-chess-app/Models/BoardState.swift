//
//  BoardState.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/10.
//

import Foundation

enum BoardState {
    
    case normal
    
    case help(Point)
    
    init() {
        self = .normal
    }
}
