//
//  ChessPieces.swift
//  swift-chess-app
//
//  Created by 이재은(Lee, Jaeeun) on 2022/09/27.
//

import Foundation

// MARK: - ChessType 체스말 종류
enum ChessType {
    case pawn

    var maxCount: Int {
        switch self {
        case .pawn:
            return 8
        }
    }
}

// MARK: - ChessPieceColor 체스말 컬러
enum ChessPieceColor {
    case black
    case white

    func toggle() -> Self {
        switch self {
        case .black:
            return .white
        case .white:
            return .black
        }
    }
}

// MARK: - ChessPieceProtocol
protocol ChessPieceProtocol {

    var type: ChessType { get }
    var color: ChessPieceColor { get }
    var currentPosition: BoardPosition { get }

    // 자신이 이동할 수 있는 위치 제공
    func getMovablePositions(for chessPieces: ChessPiece,
                             in chessBoard: ChessBoard) -> [String]
}

extension ChessPieceProtocol {

    func getMovablePositions(for chessPieces: ChessPiece,
                             in chessBoard: ChessBoard) -> [String] {

        var positions = [String]()
        // 컬러 확인
        switch chessPieces.color {
        case .black:
            print() // 하 좌 우
        case .white:
            print() // 상 좌 우
        }

        // 줄이나 행 넘어가지 않도록 체크

        return positions
    }
}

// MARK: - ChessPieces 체스말
struct ChessPiece: ChessPieceProtocol {

    let color: ChessPieceColor
    let type: ChessType
    var currentPosition: BoardPosition
}
