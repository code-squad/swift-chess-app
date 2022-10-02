//
//  ViewController.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.chessMain()
    }
    
    func chessMain() {
//        print("(프로그램 실행)")
//        let inputManager = InputManager()
//        let user1 = User(name: "JK", color: .white, controller: inputManager)
//        let user2 = User(name: "Louie", color: .black, controller: inputManager)
//
//        print("체스 보드를 초기화했습니다.")
//        let chessBrain = ChessBrain(user1: user1, user2: user2)
//        let boardPresenter = BoardPresenter()
//
//        chessBrain.start()
//        boardPresenter.display(from: chessBrain.boardToList)
//        while chessBrain.isOnGoing {
//            print("\(chessBrain.currentTurnColor.toKorean) 체스말의 차례입니다.")
//            chessBrain.turn()
//            boardPresenter.display(from: chessBrain.boardToList)
//        }
    }
}
