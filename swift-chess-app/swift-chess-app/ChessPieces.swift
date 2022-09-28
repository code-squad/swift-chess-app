//
//  ChessPieces.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

struct ChessPieces {
    let value: [ChessPiece]
    
    var whitePawns: [WhitePawn] {
        value.map { $0 as? WhitePawn }
            .compactMap { $0 }
    }
    
    var whitePawnCount: Int {
        whitePawns.count
    }
    
    var blackPawns: [BlackPawn] {
        value.map { $0 as? BlackPawn }
            .compactMap { $0 }
    }
    
    var blackPawnCount: Int {
        blackPawns.count
    }
    
    func hasWhitePawns(number: Int) -> Bool {
        return whitePawnCount == number
    }
    
    func hasBlackPawns(number: Int) -> Bool {
        return blackPawnCount == number
    }
}
