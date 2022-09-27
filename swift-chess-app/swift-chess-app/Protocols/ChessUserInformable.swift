//
//  ChessUserInformable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol ChessUserInformable {
    
    var color: ChessPieceColor { get }
    
    var state: ChessUserState { get }
    
    var pieces: [ChessPiece] { get set }
}
