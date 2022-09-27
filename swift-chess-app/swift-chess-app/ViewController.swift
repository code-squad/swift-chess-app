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
//        let user1 = ChessUser(name: "JK", color: .white)
//        let user2 = ChessUser(name: "Louie", color: .black)
//        
//        print("체스 보드를 초기화했습니다.")
//        let chessBrain = ChessBrain(user1: user1, user2: user2)
//        let chessBoardPresenter = ChessBoardPresenter()
//        
//        chessBrain.start()
//        chessBoardPresenter.display(from: chessBrain.boardToList)
//        while chessBrain.isOnGoing {
//            print("\(chessBrain.currentTurnColor.toKorean) 체스말의 차례입니다.")
//            chessBrain.turn()
//            chessBoardPresenter.display(from: chessBrain.boardToList)
//        }
    }
}
