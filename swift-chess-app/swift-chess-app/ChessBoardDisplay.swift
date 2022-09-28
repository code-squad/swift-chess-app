//
//  ChessBoardFormatter.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

enum ChessBoardDisplay {
    enum Constant {
        static let blackPawn = "\(UnicodeScalar(0x265F))"
        static let whitePawn = "\(UnicodeScalar(0x2659))"
        static let empty = "."
    }
    static func display(board: ChessBoard) -> String {
        let fileIndex = "ABCDEFG"
        let formattedBoard = board.value.enumerated()
            .map { (index: Int, rank: [ChessPiece?]) in
                displayRank(index: index, rank: rank)
            }.joined(separator: "\n")
        return "\n" + fileIndex + "\n" + formattedBoard
    }
    
    static func displayRank(index: Int, rank: [ChessPiece?]) -> String {
        let formattedRank = rank.reduce("") { partialResult, chessPiece in
            if chessPiece is BlackPawn {
                return partialResult + Constant.blackPawn
            }
            if chessPiece is WhitePawn {
                return partialResult + Constant.whitePawn
            }
            return partialResult + Constant.empty
        }
        return "\(index + 1)" + formattedRank
    }
}
