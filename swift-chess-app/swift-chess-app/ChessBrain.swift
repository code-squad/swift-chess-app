//
//  ChessBrain.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class ChessBrain {
    
    private var user1: User
    
    private var user2: User
    
    let board: Board = .init()
    
    private(set) var isOnGoing: Bool = false
    
    private(set) var currentTurnUser: User
    
    var boardToList: [[Piece?]] { board.toList }
    
    var currentTurnColor: PieceColor { currentTurnUser.color }
    
    var users: [User] { [user1, user2] }
    
    var allUserPieces: [Piece] { users.reduce([]) { $0 + $1.pieces } }
    
    init(user1: User, user2: User) {
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
    
    func startTurn() -> Action {
        return currentTurnUser.doAction()
    }
    
    func endTurn() {
        currentTurnUser = currentTurnUser == user1 ? user2 : user1
    }

    func apply(action: Action) {
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
    
    func verify(action: Action) -> Action {
        switch action {
        case .move(_, _):
            return action
        case .capture(_, _):
            return action
        default:
            return action
        }
    }
    
    func transform(action: Action) -> Action {
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
    
    func calculateScore(color: PieceColor, option: ScoreManager.ScoreOptions) -> Int {
        return board.calculateScore(color: color, option: option)
    }
}

extension ChessBrain {
    
    func prepareChessGame() {
        users.forEach { preparePawns(user: $0) }
    }
    
    func preparePieces(user: User) {
        preparePawns(user: user)
    }
    
    func preparePawns(user: User) {
        let rank: Rank?
        switch user.color {
        case .white: rank = Rank(7)
        case .black: rank = Rank(2)
        }
        guard let rank = rank else { return }
        let pieces = File.allCases.compactMap { file -> Piece in
            Pawn(color: user.color, point: Point(rank: rank, file: file))
        }
        user.pieces.append(contentsOf: pieces)
    }
}
