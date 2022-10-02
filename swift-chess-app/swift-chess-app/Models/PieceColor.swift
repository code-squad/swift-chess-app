//
//  PieceColor.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum PieceColor {
    
    case white, black
    
    var toKorean: String {
        switch self {
        case .white: return "백색"
        case .black: return "흑색"
        }
    }
}
