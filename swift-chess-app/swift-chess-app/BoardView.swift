//
//  BoardView.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    
    func didTapBoardView(point: Point)
}


final class BoardView: UIView, BoardViewable {
    
    @IBOutlet private var whiteScoreLabel: UILabel!
    
    @IBOutlet private var blackScoreLabel: UILabel!

    @IBOutlet private var buttons: [UIButton]! {
        didSet {
            setup()
        }
    }
    
    private var buttonDict: [Point: UIButton] = [:]
    
    weak var delegate: BoardViewDelegate?

    func setup() {
        buttonDict = Dictionary(uniqueKeysWithValues: buttons.compactMap { (Point(string: $0.accessibilityIdentifier!)!, $0) })
        buttons.forEach { button in button.backgroundColor = .white }
    }
    
    func display(with infos: [[PieceInfo?]]) {
        infos.enumerated().forEach { (row, infos) in
            infos.enumerated().forEach { (col, info) in
                guard let point = Point(tuple: Tuple(row: row, col: col)),
                      let button = buttonDict[point] else { return }
                button.setTitle(info?.toIcon, for: .normal)
                button.setTitleColor(info?.tintColor, for: .normal)
                button.backgroundColor = info?.background ?? .white
            }
        }
    }
    
    func display(with infos: [UserInfo]) {
        infos.forEach { info in
            let score = "Score: \(info.score)"
            switch info.color {
            case .black:
                blackScoreLabel.text = score
                
            case .white:
                whiteScoreLabel.text = score
            }
        }
    }
    
    @IBAction func didTapButton(sender: UIButton) {
        delegate?.didTapBoardView(point: Point(string: sender.accessibilityIdentifier!)!)
    }
}
