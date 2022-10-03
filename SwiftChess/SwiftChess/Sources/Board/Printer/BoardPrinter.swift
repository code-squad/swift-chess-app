//
//  BoardPrinter.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/03.
//

struct BoardPrinter {

    var printBoard: (_ status: [[BoardElementRepresentable]]) -> String
    var printCurrentPoints: (GamePoint) -> String
}

extension BoardPrinter {

    static func live(
        boardFormatter: BoardFormatter = .live
    ) -> Self {
        return Self(
            printBoard: { status in
                let formattedBoard = boardFormatter.formatBoard(status)
                print(formattedBoard)
                return formattedBoard
            },
            printCurrentPoints: { gamePoint in
                boardFormatter.formatGamePoint(gamePoint)
            }
        )
    }

    static let unimplemented = Self(
        printBoard: { _ in "" },
        printCurrentPoints: { _ in "" }
    )
}
