//
//  ChessBrain.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

final class ChessBrain {
    
    let board: Board
    
    private var user1: User
    
    private var user2: User
    
    private(set) var isOnGoing: Bool = false
    
    private(set) var currentTurnUser: User
    
    var boardToList: [[Piece?]] { board.toList }
    
    var currentTurnColor: Piece.Color { currentTurnUser.color }
    
    var users: [User] { [user1, user2] }
    
    var allPieces: [Piece] { users.reduce([]) { $0 + $1.pieces } }
    
    init(board: Board = .init(), user1: User, user2: User) {
        self.board = board
        self.user1 = user1
        self.user2 = user2
        self.currentTurnUser = user1.color == .white ? user1 : user2
    }
}

extension ChessBrain {
    
    func start() {
        prepare(users: users)
        board.set(pieces: allPieces)
        isOnGoing = true
    }
    
    func turn() {
        apply(action: startTurn())
        endTurn()
    }
    
    func help(user: User) -> [Piece: [Point]] {
        Dictionary(uniqueKeysWithValues: user.pieces.map { ($0, board.movablePoints($0)) })
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
        switch transform(action: action) {
        case let .move(point1, point2):
            board.move(point1, to: point2)
            
        case let .capture(point1, point2):
            board.capture(point1, by: point2)
            
        default:
            return
        }
    }
    
    func transform(action: Action) -> Action {
        switch action {
        case let .move(from, to):
            if board.canCapture(from, by: to) {
                return .capture(from, by: to)
            }
            if board.canMove(from, to: to) {
                return action
            }
            return .error(ChessError.impossible)
            
        default:
            return action
        }
    }
}

private extension ChessBrain {
    
    func prepare(users: [User]) {
        users.forEach { preparePieces(user: $0) }
    }
    
    func preparePieces(user: User) {
        preparePawns(user: user)
        prepareRooks(user: user)
        prepareKnights(user: user)
        prepareBishops(user: user)
        prepareQueen(user: user)
    }
    
    func preparePawns(user: User) {
        guard let rank = user.color == .white ? Rank(7) : Rank(2) else { return }
        let pieces = File.allCases.map { file -> Piece in
            Pawn(color: user.color, point: Point(rank: rank, file: file))
        }
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareRooks(user: User) {
        guard let rank = user.color == .white ? Rank(8) : Rank(1) else { return }
        let pieces = [
            Rook(color: user.color, point: Point(rank: rank, file: File.a)),
            Rook(color: user.color, point: Point(rank: rank, file: File.h))
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareKnights(user: User) {
        guard let rank = user.color == .white ? Rank(8) : Rank(1) else { return }
        let pieces = [
            Knight(color: user.color, point: Point(rank: rank, file: File.b)),
            Knight(color: user.color, point: Point(rank: rank, file: File.g))
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareBishops(user: User) {
        guard let rank = user.color == .white ? Rank(8) : Rank(1) else { return }
        let pieces = [
            Bishop(color: user.color, point: Point(rank: rank, file: File.c)),
            Bishop(color: user.color, point: Point(rank: rank, file: File.f))
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareQueen(user: User) {
        guard let rank = user.color == .white ? Rank(8) : Rank(1) else { return }
        let pieces = [
            Queen(color: user.color, point: Point(rank: rank, file: File.e))
        ]
        user.pieces.append(contentsOf: pieces)
    }
}
