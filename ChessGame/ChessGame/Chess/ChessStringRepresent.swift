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
        let filesRow = (a ..< a+UInt8(files))
            .map { Character(UnicodeScalar($0)) }
        strings[0] += String(filesRow)
        
        for rankIndex in 0..<ranks {
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
