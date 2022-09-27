//
//  ChessBoardViewable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol ChessBoardViewable {
    
    func display(from pieces: [[ChessPiece?]]) -> [String]
    
    func decoratedDisplay(from pieces: [[ChessPiece?]]) -> [String]
}
