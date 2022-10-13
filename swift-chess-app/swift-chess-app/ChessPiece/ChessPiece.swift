//
//  ChessPiece.swift
//  swift-chess-app
//
//  Created by 이재은(Lee, Jaeeun) on 2022/09/27.
//

import Foundation

// MARK: - ChessPieceProtocol
protocol ChessPieceProtocol {

    var type: ChessType { get }
    var color: ChessPieceColor { get }
}

extension ChessPieceProtocol {

    // 자신이 이동할 수 있는 위치 제공
    func getMovablePositions(from currentPosition: BoardPosition,
                             in chessBoard: ChessBoard) -> [BoardPosition] {
        return []
    }
}

//extension ChessPieceProtocol {
//
//    func getMovablePositions(for chessPieces: ChessPiece,
//                             in chessBoard: ChessBoard) -> [String] {
//
//        var positions = [String]()
//        // 컬러 확인
//        switch chessPieces.color {
//        case .black:
//            print() // 하 좌 우
//        case .white:
//            print() // 상 좌 우
//        }
//
//        // 줄이나 행 넘어가지 않도록 체크
//
//        return positions
//    }
//}

// MARK: - ChessPieces 체스말
//class ChessPiece: ChessPieceProtocol {
//
//    let color: ChessPieceColor
//    let type: ChessType
//    var currentPosition: BoardPosition
//
//    init(_ color: ChessPieceColor,
//         _ type: ChessType,
//         _ currentPosition: BoardPosition) {
//        self.color = color
//        self.type = type
//        self.currentPosition = currentPosition
//    }
//}
