//
//  ScoreOptions.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/10.
//

import Foundation

struct ScoreOptions: OptionSet {
    
    let rawValue: Int

    static let white = ScoreOptions(rawValue: 1 << 0)
    
    static let black = ScoreOptions(rawValue: 2 << 0)
    
    static let all: ScoreOptions = [.white, .black]
}

extension ScoreOptions {
    
    init(color: Color) {
        switch color {
        case .white:
            self = .white
        case .black:
            self = .black
        }
    }
}
