//
//  GamePrinter.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/03.
//

enum GameGuideText {
    case boardInitializationCompleted
    case enterCommand
}

extension GameGuideText {

    var message: String {
        switch self {
        case .boardInitializationCompleted:
            return "체스 보드를 초기화했습니다."

        case .enterCommand:
            return "명령을 입력하세요>"
        }
    }
}

struct GamePrinter {

    static func printGuideText(
        _ event: GameGuideText,
        terminator: String = "\n"
    ) -> String {
        print(event.message, terminator: terminator)
        return event.message
    }

    var printBoardInitializationCompleted: () -> String
    var printEnterCommand: () -> String
}

extension GamePrinter {

    static let live = Self(
        printBoardInitializationCompleted: { printGuideText(.boardInitializationCompleted) },
        printEnterCommand: { printGuideText(.enterCommand, terminator: "") }
    )

    static let unimplemented = Self(
        printBoardInitializationCompleted: { "" },
        printEnterCommand: { "" }
    )
}
