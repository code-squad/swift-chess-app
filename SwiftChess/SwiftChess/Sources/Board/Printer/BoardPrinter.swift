//
//  BoardPrinter.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/03.
//

struct BoardPrinter {

    var printFormattedBoard: (_ status: [[BoardElementRepresentable]]) -> String
}

extension BoardPrinter {

    static func live(
        boardFormatter: BoardFormatter = .live
    ) -> Self {
        return Self(
            printFormattedBoard: { status in
                let formattedBoard = boardFormatter.formatBoard(status)
                print(formattedBoard)
                return formattedBoard
            }
        )
    }

    static func unimplemented(
        boardFormatter: BoardFormatter = .unimplemented
    ) -> Self {
        return Self(
            printFormattedBoard: { _ in "" }
        )
    }
}
