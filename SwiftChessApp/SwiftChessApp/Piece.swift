//
//  Piece.swift
//  SwiftChessApp
//
//  Created by YoungsunMoon on 2022/09/29.
//

import Foundation

enum File: String, CaseIterable {
    case a, b, c, d, e, f, g, h
    
    var description: String {
        self.rawValue.uppercased()
    }
}

struct Piece {
    let pawn: Pawn?
    let file: File
    
    var description: String {
        pawn?.color.description ?? "."
    }
}
