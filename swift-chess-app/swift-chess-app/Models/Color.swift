//
//  Color.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/10.
//

import Foundation

enum Color {
    
    case white, black
    
    var toKorean: String {
        switch self {
        case .white:
            return "백색"
        case .black:
            return "흑색"
        }
    }
}
