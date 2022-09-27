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
        static let maxRank = 8
        static let maxFile = 8
        static let minRank = 1
        static let minFile = 1
        static let rankRange = minRank...maxRank
        static let fileRange = minFile...maxFile
    }
    
    enum Error: LocalizedError {
        case outSideOfBoard
        
        var errorDescription: String? {
            switch self {
            case .outSideOfBoard:
                return "체스판 8x8이내에 체스말이 위치할 수 있습니다."
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
    private(set) var value: [[ChessPiece?]] = .init(repeating: .init(repeating: nil, count: 8), count: 8)
    
    init(chessPieces: [ChessPiece]) throws {
        self.chessPieces = chessPieces
       
        chessPieces.forEach { chessPiece in
            guard let rank = chessPiece.location?.rank,
                  let file = chessPiece.location?.file else {
                return
            }
            if value[rank][file] == nil {
                value[rank][file] = chessPiece
                return
            }
            
            value[rank][file] = nil
        }
    }
    
    func score() -> Score {
        let whitePawnScore = blackPawns.compactMap { $0.location }
            .count
        let blackPawnScore = whitePawns.compactMap { $0.location }
            .count
        return .init(whitePawnScore: whitePawnScore, blackPawnScore: blackPawnScore)
    }
    
    mutating func move(chessAt chessLocation: Location, to toLocation: Location) -> Bool {
        let chessPiece = value[chessLocation.rank][chessLocation.file]
        guard let chessPiece = chessPiece else {
            return false
        }
        let result = chessPiece.move(to: toLocation)
        if result {
            value[toLocation.rank][toLocation.file] = chessPiece
            value[chessLocation.rank][chessLocation.file] = nil
            return true
        }
        
        return false
    }
}


