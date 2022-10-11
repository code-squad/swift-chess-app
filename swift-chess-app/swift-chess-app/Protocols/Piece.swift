//
//  Piece.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/02.
//

import Foundation


protocol Piece {
    
    var color: Color { get }
    
    var point: Point { get set }
    
    var score: Int { get }
    
    var steps: [Tuple] { get }
    
    var maxStepDistance: Int { get }
    
    var toString: String { get }
    
    var toIcon: String { get }
    
    init(color: Color, point: Point)
    
    init(color: Color)
}

extension Piece {
    
    init(color: Color, point: Point) {
        self = .init(color: color, point: point)
    }
    
    init(color: Color) {
        self = .init(color: color, point: .zero)
    }
}
