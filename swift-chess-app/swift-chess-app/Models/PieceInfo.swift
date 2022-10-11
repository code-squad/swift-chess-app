//
//  PieceInfo.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/10.
//

import UIKit

struct PieceInfo {
    
    var color: Color = .black
    
    var isGuide: Bool = false
    
    var tintColor: UIColor {
        isGuide ? .black.withAlphaComponent(0.5) : .black
    }
    
    var background: UIColor {
        isGuide ? .systemGreen.withAlphaComponent(0.5) : .white
    }
    
    var type: Piece.Type = Pawn.self
    
    var toIcon: String { type.init(color: color).toIcon }
    
    var toScore: Int { type.init(color: color).score }
}
