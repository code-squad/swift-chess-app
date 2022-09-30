//
//  Pawn.swift
//  swift chess app
//
//  Created by 윤태민(Yun, Taemin) on 2022/09/30.
//

import Foundation

struct Pawn: Pieceable {
    static let maxCount: Int = 8
    
    let color: PieceColor
    
    // TODO: 추후에 symbol이 추가된다면 따로 빼야겠다
    var symbol: String {
        color == .black ? "♟" : "♙"
    }
    
    init(color: PieceColor) {
        self.color = color
    }
}
