//
//  Piece.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation

typealias Distance = (dx: Int, dy: Int)

enum Piece {
    enum Color {
        case white
        case black
    }
    enum `Type` {
        case king
        case queen
        case bishop
        case knight
        case rook
        case pawn
    }

    case whiteKing
    case whiteQueen
    case whiteBishop
    case whiteKnight
    case whiteRook
    case whitePawn
    case blackKing
    case blackQueen
    case blackBishop
    case blackKnight
    case blackRook
    case blackPawn

    init(color: Color, type: `Type`) {
        switch (color, type) {
        case (.white, .king): self = .whiteKing
        case (.white, .queen): self = .whiteQueen
        case (.white, .bishop): self = .whiteBishop
        case (.white, .knight): self = .whiteKnight
        case (.white, .rook): self = .whiteRook
        case (.white, .pawn): self = .whitePawn
        case (.black, .king): self = .blackKing
        case (.black, .queen): self = .blackQueen
        case (.black, .bishop): self = .blackBishop
        case (.black, .knight): self = .blackKnight
        case (.black, .rook): self = .blackRook
        case (.black, .pawn): self = .blackPawn
        }
    }

    var color: Color {
        switch self {
        case .whiteKing: return .white
        case .whiteQueen: return .white
        case .whiteBishop: return .white
        case .whiteKnight: return .white
        case .whiteRook: return .white
        case .whitePawn: return .white
        case .blackKing: return .black
        case .blackQueen: return .black
        case .blackBishop: return .black
        case .blackKnight: return .black
        case .blackRook: return .black
        case .blackPawn: return .black
        }
    }

    var type: `Type` {
        switch self {
        case .whiteKing: return .king
        case .whiteQueen: return .queen
        case .whiteBishop: return .bishop
        case .whiteKnight: return .knight
        case .whiteRook: return .rook
        case .whitePawn: return .pawn
        case .blackKing: return .king
        case .blackQueen: return .queen
        case .blackBishop: return .bishop
        case .blackKnight: return .knight
        case .blackRook: return .rook
        case .blackPawn: return .pawn
        }
    }

    var image: String {
        switch self {
        case .whiteKing: return "♔"
        case .whiteQueen: return "♕"
        case .whiteBishop: return "♗"
        case .whiteKnight: return "♘"
        case .whiteRook: return "♖"
        case .whitePawn: return "♙"
        case .blackKing: return "♚"
        case .blackQueen: return "♛"
        case .blackBishop: return "♝"
        case .blackKnight: return "♞"
        case .blackRook: return "♜"
        case .blackPawn: return "♟"
        }
    }

    var score: Int {
        switch type {
        case .king:   return 1
        case .queen:  return 1
        case .bishop: return 1
        case .knight: return 1
        case .rook:   return 1
        case .pawn:   return 1
        }
    }

    func distances() -> [Distance] {
        switch (color, type) {
        case (_, .king):
            return [(0, 1), (0, -1), (-1, 1), (-1, -1), (1, 1), (1, -1), (1, 0), (-1, 0)]
        case (_, .queen):
            return [
                (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (0, 6), (0, 7),
                (0, -1), (0, -2), (0, -3), (0, -4), (0, -5), (0, -6), (0, -7),
                (1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0),
                (-1, 0), (-2, 0), (-3, 0), (-4, 0), (-5, 0), (-6, 0), (-7, 0),
                (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6),
                (-1, 1), (-2, 2), (-3, 3), (-4, 4), (-5, 5), (-6, 6),
                (1, -1), (2, -2), (3, -3), (4, -4), (5, -5), (6, -6),
                (-1, -1), (-2, -2), (-3, -3), (-4, -4), (-5, -5), (-6, -6),
            ]
        case (_, .bishop):
            return [
                (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6),
                (-1, 1), (-2, 2), (-3, 3), (-4, 4), (-5, 5), (-6, 6),
                (1, -1), (2, -2), (3, -3), (4, -4), (5, -5), (6, -6),
                (-1, -1), (-2, -2), (-3, -3), (-4, -4), (-5, -5), (-6, -6),
            ]
        case (_, .knight):
            return [(2, 1), (2, -1), (1, 2), (1, -2), (-2, 1), (-2, -1), (-1, 2), (-1, -2)]
        case (_, .rook):
            return [
                (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (0, 6), (0, 7),
                (0, -1), (0, -2), (0, -3), (0, -4), (0, -5), (0, -6), (0, -7),
                (1, 0), (2, 0), (3, 0), (4, 0), (5, 0), (6, 0), (7, 0),
                (-1, 0), (-2, 0), (-3, 0), (-4, 0), (-5, 0), (-6, 0), (-7, 0),
            ]
        case (.white, .pawn):
            return [(0, -1)]
        case (.black, .pawn):
            return [(0, 1)]
        }
    }
}
