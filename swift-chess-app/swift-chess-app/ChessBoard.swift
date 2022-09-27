//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

final class ChessBoard {
    
    typealias BoardDataType = [ChessPoint: ChessPiece]
    
    static var boardSize: Int { ChessRank.allCases.count * ChessFile.allCases.count }
    
    var data: BoardDataType = [:]
    
    var toList: [[ChessPiece?]] {
        var lists = ChessRank.allCases.map { _ -> [ChessPiece?] in
            ChessFile.allCases.map { _ -> ChessPiece? in nil }
        }
        data.forEach { (point, piece) in
            let location = piece.point.toTuple
            lists[location.row][location.col] = piece
        }
        return lists
    }
    
    let scoreManager: ScoreManager
    
    init(scoreManager: ScoreManager = .init()) {
        self.scoreManager = scoreManager
    }
}

extension ChessBoard {
    
    func set(pieces: [ChessPiece]) {
        data = Dictionary(uniqueKeysWithValues: pieces.map { ($0.point, $0) })
    }
    
    func set(point: ChessPoint, piece: ChessPiece?) {
        if var newPiece = piece {
            newPiece.update(point: point)
            data[point] = newPiece
            return
        }
        data[point] = nil
    }
    
    func find(point: ChessPoint) -> ChessPiece? {
        return data[point]
    }
    
    @discardableResult
    func move(_ from: ChessPoint, to: ChessPoint) -> Bool {
        guard let fromPiece = data[from] else {
            return false
        }
        if let toPiece = data[to], fromPiece.color == toPiece.color {
            return false
        }
        set(point: from, piece: nil)
        set(point: to, piece: fromPiece)
        return true
    }
    
    @discardableResult
    func verify() -> Bool {
        return true
    }
    
    func calculateScore(color: ChessPieceColor, option: ScoreManager.ScoreOptions) -> Int {
        return scoreManager.caculateScore(board: data, option: option)
    }
}
