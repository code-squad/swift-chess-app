//
//  OutputView.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/28.
//

import Foundation

enum OutputView {
    static func printProgramStarted() {
        Swift.print("(프로그램 실행)")
    }
        
    static func printBoardInitialzed() {
        Swift.print("체스 보드를 초기화했습니다.")
    }
    
    static func printBoard(_ value: String) {
        Swift.print(value)
    }
    
    static func print(error: LocalizedError) {
        Swift.print(error.localizedDescription)
    }
}
