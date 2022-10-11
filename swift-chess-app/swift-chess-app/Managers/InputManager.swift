//
//  InputManager.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol InputManagerDelegate: AnyObject {
    
    func didCommandEntered(action: Action)
}

class InputManager {
    
    struct Input {
        var first: Point?
        var second: Point?
        
        mutating func clear() {
            self.first = nil
            self.second = nil
        }
    }
    
    private var input: Input
    
    weak var delegate: InputManagerDelegate?
    
    init() {
        self.input = Input()
    }
    
    func clear() { input.clear() }
}


extension InputManager: BoardViewDelegate {
    
    func didTapBoardView(point: Point) {
        if checkIsFirstInput() {
            handleFirstInput(point: point)
        } else if checkIsSecondInput() {
            handleSecondInput(point: point)
        }
    }
}

private extension InputManager {
    
    func checkIsFirstInput() -> Bool { input.first == nil }
    
    func checkIsSecondInput() -> Bool { input.first != nil && input.second == nil }
    
    func handleFirstInput(point: Point) {
        input.first = point
        delegate?.didCommandEntered(action: .help(point))
    }
    
    func handleSecondInput(point: Point) {
        guard let first = input.first else { return }
        if first == point {
            delegate?.didCommandEntered(action: .cancel)
        } else {
            input.second = point
            delegate?.didCommandEntered(action: .move(from: first, to: point))
        }
        clear()
    }
    
}
