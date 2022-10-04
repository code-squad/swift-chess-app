//
//  ViewController.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/26.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let users: [User] = [BlackUser(), WhiteUser()]
        let chessGame = ChessGame(users: users)

        print(chessGame.board.description())
    }
}

