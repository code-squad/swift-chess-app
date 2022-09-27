//
//  ChessAction.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

enum ChessAction {
    
    case move(from: ChessPoint, to: ChessPoint)
    
    case capture(_ piece: ChessPiece, by: ChessPiece)
    
    case giveUp
    
    case unknown
}
