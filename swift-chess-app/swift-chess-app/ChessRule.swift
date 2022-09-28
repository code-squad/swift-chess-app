//
//  ChessRule.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

enum ChessRule {
    enum Error: LocalizedError {
        case pawnCountWrong
        case wrongWhitePawnLocation
        case wrongBlackPawnLocation
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
            case .wrongWhitePieceLocation:
                return "초기 흑백 체스말 위치는 1,2-rank입니다."
            case .wrongBlackPieceLocation:
                return "초기 백색 체스말 위치는 7,8-rank입니다."
            }
        }
    }
    static func checkPawnCount(chessPieces: ChessPieces) throws {
        guard chessPieces.hasWhitePawns(number: ChessConstant.pawnsCount),
              chessPieces.hasBlackPawns(number: ChessConstant.pawnsCount) else {
                throw Error.pawnCountWrong
        }
    }
    
    static func checkInitialLocation(chessPieces: ChessPieces) throws {
        let rightWhitePawnCount = chessPieces.whitePawns
            .filter { $0.located(atRank: ChessConstant.initalWhiteRank) }
            .count
        if rightWhitePawnCount != ChessConstant.pawnsCount {
            throw Error.wrongWhitePawnLocation
        }
        
        let rightBlackPawnCount = chessPieces.blackPawns
            .filter { $0.located(atRank: ChessConstant.initalBlackRank) }
            .count
        if rightBlackPawnCount != ChessConstant.pawnsCount {
            throw Error.wrongBlackPawnLocation
        }
    }
}
