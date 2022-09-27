//
//  ChessUserState.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/26.
//

import Foundation

enum ChessUserState {
    
    case ready, waiting, playing, finished
    
    init() {
        self = .ready
    }
}
