//
//  BoardViewable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol BoardViewable {
    
    func display(from pieces: [[Piece?]]) -> [String]
    
    func decoratedDisplay(from pieces: [[Piece?]]) -> [String]
}
