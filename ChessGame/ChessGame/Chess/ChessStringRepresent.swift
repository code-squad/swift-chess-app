//
//  ChessStringRepresent.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/25.
//

import Foundation

extension ChessPiece {
    var symbolString: Character {
        switch type {
        case .pawn:
            return teamColor == .white ? "♙" : "♟"
        }
    }
}

extension ChessBoard {
    func textFormatted() -> String {
        var strings = [" "]
        // file 알파벳 추가
        let a = UInt8(ascii: "A")
        let filesRow = (a ..< a+UInt8(filesCount))
            .map { Character(UnicodeScalar($0)) }
        strings[0] += String(filesRow)
        
        for rankIndex in 0..<ranksCount {
            let rankRowString = "\(rankIndex + 1)" + makeRankRowString(data[rankIndex])
            strings.append(rankRowString)
        }
        
        return strings.joined(separator: "\n")
    }
    
    private func makeRankRowString(_ rankRow: [ChessPiece?]) -> String {
        let rankRowCharacters = rankRow.map { piece in
            if let piece {
                return piece.symbolString
            } else {
                return "."
            }
        }
        return String(rankRowCharacters)
    }
}

extension Position {
    init?(_ string: String) {
        let args = Array(string)
        guard
            args.count == 2,
            let fileUnicode = args[0].unicodeScalars.first,
            let rankValue = Int(String(args[1]))
        else { return nil }
        let file = Int(UInt8(ascii: fileUnicode) - UInt8(ascii: "A"))
        guard file >= 0, rankValue > 0 else { return nil }
        self.init(file: file, rank: rankValue - 1)
    }
}
