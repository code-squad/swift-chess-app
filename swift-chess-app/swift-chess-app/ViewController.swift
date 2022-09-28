//
//  ViewController.swift
//  swift-chess-app
//
//  Created by nylah.j on 2022/09/27.
//

import UIKit

class ViewController: UIViewController {
    private var whiteTurn = true
    
    enum Error: LocalizedError {
        case wrongTurn(whiteTurn: Bool)
        case canNotMove
        
        var errorDescription: String? {
            switch self {
                
            case .wrongTurn(let whiteTurn):
                return whiteTurn ? "백색 체스말의 차례입니다." : "흑색 체스말의 차례입니다."
            case .canNotMove:
                return "체스말을 옮길 수 없습니다."
            }
        }
    }

    // MARK: - main()
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            OutputView.printProgramStarted()
            let whitePawnName = String(describing: WhitePawn.self)
            let blackPawnName = String(describing: BlackPawn.self)
            
            let whitePawnLocations = (ChessConstant.minFile...ChessConstant.maxFile)
                .map { file in
                    Location(rank: ChessConstant.initalWhiteRank, file: file)
                }
            let blackPawnLocations = (ChessConstant.minFile...ChessConstant.maxFile)
                .map { file in
                    Location(rank: ChessConstant.initalBlackRank, file: file)
                }
            
            let whitePawns = try ChessPieceFactory.create(chessPieceName: whitePawnName, locations: whitePawnLocations)
            let blackPawns = try ChessPieceFactory.create(chessPieceName: blackPawnName, locations: blackPawnLocations)
            
            let chessPieces = ChessPieces(value: whitePawns + blackPawns)
            
            try ChessRule.checkPawnCount(chessPieces: chessPieces)
            try ChessRule.checkInitialLocation(chessPieces: chessPieces)
            
            var chessBoard = try ChessBoard(chessPieces: chessPieces)
            OutputView.printBoardInitialzed()
            
            let chessBoardDisplay = ChessBoardDisplay.display(board: chessBoard)
            OutputView.printBoard(chessBoardDisplay)
            
            let time = InputView.readTime()
            for _ in (0..<time) {
                let commandValue = InputView.readCommand()
                let command = try CommandParser.parse(commandValue: commandValue)
                
                if chessBoard.isWhite(atLocation: command.fromLocation) != whiteTurn {
                    OutputView.print(error: Error.wrongTurn(whiteTurn: whiteTurn))
                    continue
                }
                
                let isSuccess = chessBoard.move(chessAt: command.fromLocation, to: command.toLocation)
                if isSuccess  {
                    let chessBoardDisplay = ChessBoardDisplay.display(board: chessBoard)
                    OutputView.printBoard(chessBoardDisplay)
                    whiteTurn = !whiteTurn
                    continue
                }
                
                OutputView.print(error: Error.canNotMove)
            }
        } catch(let error) {
            OutputView.print(error: error as! LocalizedError)
        }
    }
}

