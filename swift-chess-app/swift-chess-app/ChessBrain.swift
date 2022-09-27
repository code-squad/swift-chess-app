//
//  ChessBrain.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class ChessBrain {
    
    private var user1: ChessUser
    
    private var user2: ChessUser
    
    let board: ChessBoard = .init()
    
    private(set) var isOnGoing: Bool = false
    
    private(set) var currentTurnUser: ChessUser
    
    var boardToList: [[ChessPiece?]] { board.toList }
    
    var currentTurnColor: ChessPieceColor { currentTurnUser.color }
    
    var users: [ChessUser] { [user1, user2] }
    
    var allUserPieces: [ChessPiece] { users.reduce([]) { $0 + $1.pieces } }
    
    init(user1: ChessUser, user2: ChessUser) {
        self.user1 = user1
        self.user2 = user2
        self.currentTurnUser = user1.color == .white ? user1 : user2
    }
}

extension ChessBrain {
    
    func start() {
        prepareChessGame()
        board.set(pieces: allUserPieces)
        isOnGoing = true
    }
    
    func turn() {
        let userAction = startTurn()
        apply(action: userAction)
        endTurn()
    }
}

private extension ChessBrain {
    
    func startTurn() -> ChessAction {
        return currentTurnUser.doAction()
    }
    
    func endTurn() {
        currentTurnUser = currentTurnUser == user1 ? user2 : user1
    }

    func apply(action: ChessAction) {
        let verifiedAction = verify(action: action)
        let transformedAction = transform(action: verifiedAction)
        switch transformedAction {
        case let .move(from, to):
            board.move(from, to: to)
        case .capture(_, _):
            return
        case .giveUp:
            return
        default:
            return
        }
    }
    
    func verify(action: ChessAction) -> ChessAction {
        switch action {
        case .move(_, _):
            return action
        case .capture(_, _):
            return action
        default:
            return action
        }
    }
    
    func transform(action: ChessAction) -> ChessAction {
        switch action {
        case let .move(from, to):
            guard let fromPiece = board.find(point: from) else { return action }
            if let toPiece = board.find(point: to), fromPiece.color != toPiece.color {
                return .capture(toPiece, by: fromPiece)
            }
            return action
        case .capture:
            return action
        default:
            return action
        }
    }
    
    func calculateScore(color: ChessPieceColor, option: ScoreManager.ScoreOptions) -> Int {
        return board.calculateScore(color: color, option: option)
    }
}

extension ChessBrain {
    
    func prepareChessGame() {
        users.forEach { user in
            preparePawns(user: user)
        }
    }
    
    func preparePieces(user: ChessUser) {
        preparePawns(user: user)
    }
    
    func preparePawns(user: ChessUser) {
        let rank: ChessRank?
        switch user.color {
        case .white: rank = ChessRank(7)
        case .black: rank = ChessRank(2)
        }
        guard let rank = rank else { return }
        let pieces = ChessFile.allCases.compactMap { file -> ChessPiece in
            Pawn(color: user.color, point: ChessPoint(rank: rank, file: file))
        }
        user.pieces.append(contentsOf: pieces)
    }
}
