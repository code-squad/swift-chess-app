//
//  ChessBrain.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol ChessBrainDelegate: AnyObject {
    
    func didCanceled(action: Action, board: Board)
    
    func didChanged(users: [User])
    
    func didCompleted(action: Action, board: Board)
}

final class ChessBrain {
    
    let board: Board
    
    private var user1: User
    
    private var user2: User
    
    private(set) var isOnGoing: Bool = false
    
    private(set) var currentTurnUser: User
    
    var boardToList: [[PieceInfo?]] { board.toList }
    
    var currentTurnColor: Color { currentTurnUser.color }
    
    var users: [User] { [user1, user2] }
    
    var allPieces: [Piece] { users.reduce([]) { $0 + $1.pieces } }
    
    weak var delegate: ChessBrainDelegate?
    
    init(board: Board = Board(scoreManager: ScoreManager()), user1: User, user2: User) {
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
}


extension ChessBrain: InputManagerDelegate {
    
    func didCommandEntered(action: Action) {
        apply(action: action)
    }
}

private extension ChessBrain {
    
    func endTurn() {
        currentTurnUser = currentTurnUser == user1 ? user2 : user1
        board.set(state: .normal)
    }

    func apply(action: Action) {
        let verified = board.verify(action: action, color: currentTurnColor)
        let transformed = board.transform(action: verified)
        
        switch transformed {
        case let .help(point):
            board.help(point)
            
        case .cancel:
            board.set(state: .normal)
            delegate?.didCanceled(action: action, board: board)
            
        case let .move(point1, point2):
            board.move(point1, to: point2)
            endTurn()
            
        case let .capture(point1, point2):
            board.capture(point1, point2)
            update(users: users)
            delegate?.didChanged(users: users)
            endTurn()
            
        default:
            return
        }
        
        delegate?.didCompleted(action: action, board: board)
    }
    
    func update(users: [User]) {
        users.forEach {
            $0.score = board.calculateScore(option: ScoreOptions(color: $0.color))
        }
    }
}

private extension ChessBrain {
    
    func prepare(users: [User]) {
        users.forEach { preparePieces(user: $0) }
    }
    
    func prepareRank(info: PieceInfo) -> Rank {
        switch info.type {
        case is Pawn.Type:
            return info.color == .white ? Rank.seven : Rank.two
            
        default:
            return info.color == .white ? Rank.eight : Rank.one
        }
    }
    
    func preparePieces(user: User) {
        preparePawns(user: user)
        prepareRooks(user: user)
        prepareKnights(user: user)
        prepareBishops(user: user)
        prepareQueen(user: user)
        prepareKing(user: user)
    }
    
    func preparePawns(user: User) {
        let pieces = File.allCases.map { file -> Piece in
            Pawn(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Pawn.self)), file: file)
            )
        }
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareRooks(user: User) {
        let pieces = [
            Rook(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Rook.self)), file: File.a)
            ),
            Rook(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Rook.self)), file: File.h)
            )
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareKnights(user: User) {
        let pieces = [
            Knight(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Knight.self)), file: File.b)
            ),
            Knight(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Knight.self)), file: File.g)
            )
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareBishops(user: User) {
        let pieces = [
            Bishop(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Bishop.self)), file: File.c)
            ),
            Bishop(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Bishop.self)), file: File.f)
            )
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareQueen(user: User) {
        let pieces = [
            Queen(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: Queen.self)), file: File.e)
            )
        ]
        user.pieces.append(contentsOf: pieces)
    }
    
    func prepareKing(user: User) {
        let pieces = [
            King(
                color: user.color,
                point: Point(rank: prepareRank(info: PieceInfo(color: user.color, type: King.self)), file: File.d)
            )
        ]
        user.pieces.append(contentsOf: pieces)
    }
}
