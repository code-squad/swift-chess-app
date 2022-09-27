//
//  ChessPoint.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct ChessPoint: Hashable {
    
    let rank: ChessRank
    
    let file: ChessFile
    
    var toString: String { file.toString + rank.toString }
    
    var toTuple: (row: Int, col: Int) { (row: rank.num - 1, col: file.toInt) }
}

extension ChessPoint {
    
    init?(string: String) {
        guard string.count == 2,
              let firstCharacter = string.first,
              let secondCharacter = string.last,
              let file = ChessFile(String(firstCharacter)),
              let rank = ChessRank(String(secondCharacter)) else { return nil }
        self.rank = rank
        self.file = file
    }
}

extension ChessPoint: Equatable {
    
    static func == (lhs: ChessPoint, rhs: ChessPoint) -> Bool {
        return lhs.file == rhs.file && lhs.rank == rhs.rank
    }
}
