//
//  GamePrinter.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/03.
//

struct GameGuideTextProvider {

    enum Event {

        case boardInitializationCompleted
        case enterCommand
    }

    var boardInitializationCompleted: () -> Self.Event
    var enterCommand: () -> Self.Event
}

extension GameGuideTextProvider.Event: CustomStringConvertible {

    var description: String {
        switch self {
        case .boardInitializationCompleted:
            return "체스 보드를 초기화했습니다."

        case .enterCommand:
            return "명령을 입력하세요>"
        }
    }
}

extension GameGuideTextProvider {

    static let live = Self(
        boardInitializationCompleted: { .boardInitializationCompleted },
        enterCommand: { .enterCommand }
    )
}

struct GamePrinter {

    static func printGuideText(
        _ event: GameGuideTextProvider.Event,
        terminator: String = "\n"
    ) -> GameGuideTextProvider.Event {
        print(event, terminator: terminator)
        return event
    }

    var printBoardInitializationCompleted: () -> GameGuideTextProvider.Event
    var printEnterCommand: () -> GameGuideTextProvider.Event
}

extension GamePrinter {

    static let live = Self(
        printBoardInitializationCompleted: { printGuideText(.boardInitializationCompleted) },
        printEnterCommand: { printGuideText(.enterCommand, terminator: "") }
    )
}
