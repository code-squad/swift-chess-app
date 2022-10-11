//
//  ChessViewController.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/24.
//

import UIKit

class ChessViewController: UIViewController {
    
    @IBOutlet weak var boardView: BoardView!
    
    let inputManager = InputManager()
    
    let user1 = User(name: "JK", color: .white)
    
    let user2 = User(name: "Louie", color: .black)
    
    lazy var chessBrain = ChessBrain(user1: user1, user2: user2)

    override func viewDidLoad() {
        super.viewDidLoad()
        chessMain()
    }
    
    func chessMain() {
        boardView.delegate = inputManager
        inputManager.delegate = chessBrain
        chessBrain.delegate = self
        
        chessBrain.start()
        boardView.display(with: chessBrain.users.map { $0.toUserInfo })
        boardView.display(with: chessBrain.boardToList)
    }
}

extension ChessViewController: ChessBrainDelegate {
    
    func didCompleted(action: Action, board: Board) {
        boardView.display(with: board.toList)
    }
    
    func didCanceled(action: Action, board: Board) {
        inputManager.clear()
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    func didChanged(users: [User]) {
        boardView.display(with: users.map { $0.toUserInfo })
    }
}
