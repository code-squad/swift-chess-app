//
//  Board.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

final class Board {
    
    typealias BoardDataType = [Point: Piece]
    
    static var boardSize: Int { Rank.allCases.count * File.allCases.count }
    
    var data: BoardDataType = [:]
    
    var toList: [[Piece?]] {
        var lists = Rank.allCases.map { _ -> [Piece?] in File.allCases.map { _ -> Piece? in nil } }
        data.forEach { (_, piece) in
            let loc = piece.point.toTuple
            lists[loc.row][loc.col] = piece
        }
        return lists
    }
    
    let scoreManager: ScoreManager
    
    init(scoreManager: ScoreManager = .init()) {
        self.scoreManager = scoreManager
    }
}

extension Board {
    
    func set(pieces: [Piece]) {
        data = Dictionary(uniqueKeysWithValues: pieces.map { ($0.point, $0) })
    }
    
    func set(point: Point, piece: Piece?) {
        if var newPiece = piece {
            newPiece.update(point: point)
            data[point] = newPiece
            return
        }
        data[point] = nil
    }
    
    func find(point: Point) -> Piece? {
        return data[point]
    }
    
    @discardableResult
    func move(_ from: Point, to: Point) -> Bool {
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
    
    func calculateScore(color: PieceColor, option: ScoreManager.ScoreOptions) -> Int {
        return scoreManager.caculateScore(board: data, option: option)
    }
}
