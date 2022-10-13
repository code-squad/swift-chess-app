//
//  ViewController.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import UIKit

class ChessGameViewController: UIViewController {
    lazy var chessGame: ChessGame = {
        return ChessGame(presenter: self)
    }()
    
    lazy var boardView: BoardView = {
        let maxSquare = UIScene.maxSquare
        let row = Dimension.Board.length
        let col = Dimension.Board.length
        
        let boardView = BoardView(frame: CGRect(origin: CGPoint(x: 0, y: (UIScreen.main.bounds.height - maxSquare.height) / 2),
                                                size: maxSquare),
                                  row: row,
                                  col: col)
        boardView.delegate = self
        
        return boardView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGame()
    }
    
    private func setupUI() {
        self.view.addSubview(boardView)
        
    }
    
    private func startGame() {
        chessGame.start()
    }
}

// MARK: - present
extension ChessGameViewController: Presentable {
    func displayMovablePosition(_ positions: [Position]) {
        positions
            .map({ ($0.rank.rawValue - 1 , $0.file.rawValue - 1) })
            .forEach({
                boardView.update(row: $0.0, col: $0.1, color: .red)
            })
    }
    
    func score(color: ChessPieceColor, score: Int) {
        print("color:: \(color), score:: \(score)")
    }
    
    func clear() {
        boardView.clear()
    }
    
    func display(row: Int, col: Int, description: String) {
        boardView.update(row: row, col: col, description: description)
        self.view.setNeedsDisplay()
    }
}

extension ChessGameViewController: BoardViewDelegate {
    func clickedCompartment(_ sender: UIButton?) {
        // TODO: error 나누기 
        guard chessGame.checkContinueGame() else { return }
        guard let indexPath = boardView.position(sender) else { return }
        chessGame.inputPosition(row: indexPath.row, col: indexPath.col)
    }
}
