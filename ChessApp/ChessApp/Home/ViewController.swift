//
//  ViewController.swift
//  ChessApp
//
//  Created by seongmin.kim on 2022/09/27.
//

import UIKit

enum Pawn {
    case black
    case white
    
    var initPosition: Int {
        switch self {
        case .black: return 1
        case .white: return 6
        }
    }
    
    var turn: String {
        switch self {
        case .black: return "흑색 체스말의 차례입니다."
        case .white: return "백색 체스말의 차례입니다."
        }
    }
    
    var display: String {
        switch self {
        case .black: return "♟"
        case .white: return "♙"
        }
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

