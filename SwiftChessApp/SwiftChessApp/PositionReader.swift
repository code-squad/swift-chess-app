//
//  PositionReader.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/11.
//

import Foundation

class PositionReader {
    static let shared: PositionReader = .init()
    private init() {}

    func translate(input: String) -> Position? {
        guard
            input.count == 2,
            let currentFile = Position.File(value: String(input[input.startIndex])),
            let currentRank = Position.Rank(value: String(input[input.index(after: input.startIndex)]))
        else {
            return nil
        }
        return Position(x: currentFile, y: currentRank)
    }
}
