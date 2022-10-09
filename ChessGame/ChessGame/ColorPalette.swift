//
//  ColorPalette.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/10.
//

import SwiftUI

extension Color {
    static let blackFloor = Color(r: 199, g: 142, b: 83)
    static let whiteFloor = Color(r: 247, g: 208, b: 164)
    
    init(r: Int, g: Int, b: Int) {
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
