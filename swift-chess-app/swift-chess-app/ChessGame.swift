//
//  ChessGame.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

struct ChessGame {
    enum Constant {
        static let initalWhiteRank = 7
        static let initalBlackRank = 2
        static let pawnsCount = 8
    }
    
    enum Error: LocalizedError {
        case pawnCountWrong
        case wrongWhitePawnLocation
        case wrongBlackPawnLocation
        case outSideOfBoard
        case wrongWhitePieceLocation
        case wrongBlackPieceLocation
        
        var errorDescription: String? {
            switch self {
            case .pawnCountWrong:
                return "Pawn는 색상별로 8개만 가능합니다."
            case .wrongWhitePawnLocation:
                return "초기 생성 위치는 흑색은 2-rank만 가능합니다."
            case .wrongBlackPawnLocation:
                return "초기 생성 위치는 백색은 7-rank만 가능합니다."
            case .outSideOfBoard:
                return "체스판 8x8이내에 체스말이 위치할 수 있습니다."
            case .wrongWhitePieceLocation:
                return "초기 흑백 체스말 위치는 1,2-rank입니다."
            case .wrongBlackPieceLocation:
                return "초기 백색 체스말 위치는 7,8-rank입니다."
            }
        }
    }
    
    let chessPieces: [ChessPiece]
    var whitePawns: [WhitePawn] {
        chessPieces.map { $0 as? WhitePawn }
            .compactMap { $0 }
    }
    var blackPawns: [BlackPawn] {
        chessPieces.map { $0 as? BlackPawn }
            .compactMap { $0 }
    }
    
    init(chessBoard: ChessBoard, chessPieces: [ChessPiece]) throws {
        self.chessPieces = chessPieces
        let rightWhitePawnCount = whitePawns.filter { $0.location?.rank == Constant.initalWhiteRank }
            .count
        if rightWhitePawnCount != Constant.pawnsCount {
            throw Error.wrongWhitePawnLocation
        }
        
        let rightBlackPawnCount = blackPawns.filter { $0.location?.rank == Constant.initalBlackRank }
            .count
        if rightBlackPawnCount != Constant.pawnsCount {
            throw Error.wrongBlackPawnLocation
        }
    }
}
