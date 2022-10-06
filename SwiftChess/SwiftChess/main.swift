//
//  main.swift
//  SwiftChess
//
//  Created by Sunghyun Kim on 2022/10/06.
//

import Foundation

struct Position {
    var rank: Int
    var file: Int
}

enum Color {
    case black
    case white
}

protocol Piece {
    var color: Color { get }
//    var position: Position { get }
    var initialPosition: [Position] { get }
}

struct BlackKing: Piece {
    let color: Color = .black
//    var position: Position
    let initialPosition: [Position] = [Position(rank: 0, file: 3)]
}
struct WhiteKing: Piece {
    let color: Color = .white
//    var position: Position
    let initialPosition: [Position] = [Position(rank: 7, file: 3)]
}

struct Board {
    var data: [[Piece?]]
    
    init() {
        let rank = [Piece?](repeating: nil, count: 8)
        data = [[Piece?]](repeating: rank, count: 8)
    }
    
    mutating func initPieces() {
        let pieces: [Piece] = [
            BlackKing(), WhiteKing()
        ]
        for piece in pieces {
            for position in piece.initialPosition {
                data[position.rank][position.file] = piece
            }
        }
        
    }
}

