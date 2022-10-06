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

protocol Piece: AnyObject {
    var color: Color { get }
    var currentPosition: Position? { get set }
    var initialPosition: [Position] { get }
}

class BlackKing: Piece {
    let color: Color = .black
    var currentPosition: Position?
    let initialPosition: [Position] = [Position(rank: 0, file: 3)]
}
class WhiteKing: Piece {
    let color: Color = .white
    var currentPosition: Position?
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
                addToBoard(position: position, piece: piece)
            }
        }
    }
    
    mutating func addToBoard(position: Position, piece: Piece) {
        data[position.rank][position.file] = piece
        piece.currentPosition = position
    }
}

