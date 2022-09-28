//
//  InputView.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

enum InputView {
    // TODO: 제거
    static var count = 0
    
    static func readTime() -> Int {
        print("명령 실행 횟수를 입력하세요> ", terminator: "")
        
        return 2
        // TODO: readLine() not work
        guard let input = readLine(),
              input.isEmpty == false,
              let inputNumber = Int(input) else {
            return readTime()
        }
        
        return inputNumber
    }
    
    static func readCommand() -> String {
        print("명령을 입력하세요> ", terminator: "")
        if count == .zero {
            count += 1
            return "A2->A3"
        }
        if count > .zero {
            count += 1
            return "A7->A6"
        }
        
        // TODO: readLine() not work
        guard let input = readLine(),
              input.isEmpty == false else {
                  return readCommand()
              }
        return input
    }
}
