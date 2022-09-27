//
//  Constant.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

struct Score {
    let whitePawnScore: Int
    let blackPawnScore: Int
}

struct ChessBoard {
    enum Constant {
        static let rankCount = 8
        static let fileCount = 8
        static let maxRank = 8
        static let minRank = 1
        static let minFile = "A"
        static let maxFile = "H"
        static let rankRange = minRank...maxRank
        static let pawnsCount = 8
        static let initalWhiteRank = 7
        static let initalBlackRank = 2
    }
    
    enum Error: LocalizedError {
        case pawnCountWrong
        case wrongWhitePawnLocation
        case wrongBlackPawnLocation
        
        var errorDescription: String? {
            switch self {
            case .pawnCountWrong:
                return "Pawn는 색상별로 8개만 가능합니다."
            case .wrongWhitePawnLocation:
                return "초기 생성 위치는 흑색은 2-rank만 가능합니다."
            case .wrongBlackPawnLocation:
                return "초기 생성 위치는 백색은 7-rank만 가능합니다."
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
    let value: [[ChessPiece?]] = .init(repeating: .init(repeating: nil, count: 8), count: 8)
    
    init(chessPieces: [ChessPiece]) throws {
        self.chessPieces = chessPieces
        if whitePawns.count > Constant.pawnsCount || blackPawns.count > Constant.pawnsCount {
            throw Error.pawnCountWrong
        }
        
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
    
    func score() -> Score {
        let whitePawnScore = blackPawns.compactMap { $0.location }
            .count
        let blackPawnScore = whitePawns.compactMap { $0.location }
            .count
        return .init(whitePawnScore: whitePawnScore, blackPawnScore: blackPawnScore)
    }
}


