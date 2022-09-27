//
//  ChessBoardFormatter.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import Foundation

enum ChessBoardFormatter {
    enum Constant {
        static let blackPawn = "\(String(describing: UnicodeScalar(0x265F)))"
        static let whitePawn = "\(String(describing: UnicodeScalar(0x2659)))"
        static let empty = "."
    }
    static func format(board: ChessBoard) -> String {
        let fileIndex = "ABCDEFG"
        let formattedBoard = board.value.enumerated()
            .map { (index, rank) in
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
            }.joined(separator: "\n")
        return fileIndex + "\n" + formattedBoard
    }
}
