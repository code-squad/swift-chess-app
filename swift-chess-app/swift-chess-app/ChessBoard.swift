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

enum ChessConstant {
    static let maxRank = 7
    static let maxFile = 7
    static let minRank = 0
    static let minFile = 0
    static let rankRange = minRank...maxRank
    static let fileRange = minFile...maxFile
    static let initalWhiteRank = 6
    static let initalBlackRank = 1
    static let pawnsCount = 8
}

struct ChessBoard {
    let chessPieces: ChessPieces
    var whitePawns: [WhitePawn] {
        chessPieces.whitePawns
    }
    var blackPawns: [BlackPawn] {
        chessPieces.blackPawns
    }
    
    private(set) var value: [[ChessPiece?]] = .init(repeating: .init(repeating: nil, count: 8), count: 8)
    
    init(chessPieces: ChessPieces) throws {
        self.chessPieces = chessPieces
        
        chessPieces.value.forEach { chessPiece in
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
        let whitePawnScore = blackPawns.filter { $0.location == nil}
            .count
        let blackPawnScore = whitePawns.filter { $0.location == nil}
            .count
        return .init(whitePawnScore: whitePawnScore, blackPawnScore: blackPawnScore)
    }
    
    mutating func move(chessAt chessLocation: Location, to toLocation: Location) -> Bool {
        let chessPiece = value[chessLocation.rank][chessLocation.file]
        guard let chessPiece = chessPiece else {
            return false
        }
        
        guard let chessPieceAtToLocation = value[toLocation.rank][toLocation.file],
           chessPiece.isWhite != chessPieceAtToLocation.isWhite else {
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
    
    func isWhite(atLocation location: Location) -> Bool {
        guard let chessPiece = value[location.rank][location.file] else {
            return false
        }
        return chessPiece.isWhite
    }
}


