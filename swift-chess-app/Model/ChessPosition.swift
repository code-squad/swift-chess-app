//
//  ChessPosition.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/27.
//

import Foundation

struct ChessPosition: Equatable {
    let rank: Int
    let file: Int
    
    var position: String {
        guard let unicode = UnicodeScalar(asciiA + file) else { fatalError("position 변환 오류 \(file) \(rank)") }
        return "\(Character(unicode))\(rank + 1)"
    }
    
    public init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
    }
    
    public init(_ position: String) {
        let arr = Array(position.uppercased())
        guard let rank = arr[1].wholeNumberValue,
              let fileAscii = arr[0].asciiValue
        else { fatalError("입력 변환 오류 \(position)") }
        
        self.rank = rank - 1
        self.file = Int(fileAscii) - asciiA
    }
    
    public static func ==(lhs: ChessPosition, rhs: ChessPosition) -> Bool {
        lhs.rank == rhs.rank && lhs.file == rhs.file
    }
    
    public static func ==(lhs: ChessPosition, rhs: String) -> Bool {
        let position = ChessPosition(rhs)
        
        return lhs.rank == position.rank && lhs.file == position.file
    }
    
    public static func ==(lhs: String, rhs: ChessPosition) -> Bool {
        let position = ChessPosition(lhs)
        
        return position.rank == rhs.rank && position.file == rhs.file
    }
}
