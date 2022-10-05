//
//  BoardFormatter.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/03.
//

struct BoardFormatter {

    var formatBoard: (_ status: [[BoardElementRepresentable]]) -> String
    var formatGamePoint: (GamePoint) -> String

}

extension BoardFormatter {

    static let live = Self(
        formatBoard: { status in
            var symbols = status.map { rank in
                return rank
                    .map(\.asSymbol.rawValue)
                    .joined()
            }

            var taggedSymbols: [String] = []

            for index in 0...7 {
                let rankTag = index + 1
                taggedSymbols.append("\(rankTag)\(symbols[index])")
            }

            let fileTags = " ABCDEFGH"
            taggedSymbols.insert(fileTags, at: 0)
            taggedSymbols.append(fileTags)

            let formatted = taggedSymbols.joined(separator: "\n")
            return formatted
        },
        formatGamePoint: { gamePoint in
            return "체스말을 잡았습니다. 현재점수 - 백: \(gamePoint.white), 흑: \(gamePoint.black)"
        }
    )
}
