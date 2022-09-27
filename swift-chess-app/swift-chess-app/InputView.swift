//
//  InputView.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

enum InputView {
    func readCommand() -> String {
        print("명령을 입력하세요> ", terminator: "")
        guard let input = readLine(),
              input.isEmpty == false else {
                  return readCommand()
              }
        return input
    }
}
