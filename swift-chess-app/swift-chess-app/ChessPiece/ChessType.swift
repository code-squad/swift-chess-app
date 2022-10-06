//
//  ChessType.swift
//  swift-chess-app
//
//  Created by 이재은 on 2022/10/03.
//

import Foundation

// MARK: - ChessType 체스말 종류
enum ChessType {
    case pawn
    case bishop
    case knight
    case rook
    case queen
    case none

    var maxCount: Int {
        switch self {
        case .pawn:
            return 8
        case .bishop, .knight, .rook:
            return 2
        case .queen:
            return 1
        case .none:
            return 0
        }
    }

    var blackPiece: String {
        switch self {
        case .pawn:
            return "♟"
        case .bishop:
            return "♝"
        case .knight:
            return "♞"
        case .rook:
            return "♜"
        case .queen:
            return "♛"
        case .none:
            return "."
        }
    }

    var whitePiece: String {
        switch self {
        case .pawn:
            return "♙"
        case .bishop:
            return "♗"
        case .knight:
            return "♘"
        case .rook:
            return "♖"
        case .queen:
            return "♕"
        case .none:
            return "."
        }
    }

    var score: Int {
        switch self {
        case .pawn:
            return 1
        case .bishop, .knight:
            return 3
        case .rook:
            return 5
        case .queen:
            return 9
        case .none:
            return 0
        }
    }
}

extension ChessType: Equatable, CaseIterable {
    
}

// MARK: - ChessPieceColor 체스말 컬러
enum ChessPieceColor {
    case black
    case white
    case none

    func toggle() -> Self {
        switch self {
        case .black:
            return .white
        case .white:
            return .black
        case .none:
            return .none
        }
    }
}
