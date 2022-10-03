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
    
    private(set) var data: BoardDataType = [:]
    
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
    
    func toPiece(_ point: Point) -> Piece? { data[point] }
    
    func set(pieces: [Piece]) {
        data = Dictionary(uniqueKeysWithValues: pieces.map { ($0.point, $0) })
    }
    
    func set(point: Point, piece: Piece?) {
        piece?.point = point
        data[point] = piece
    }
    
    @discardableResult
    func move(_ from: Point, to: Point) -> Bool {
        guard canMove(from, to: to) else { return false }
        set(point: to, piece: toPiece(from))
        set(point: from, piece: nil)
        return true
    }
    
    @discardableResult
    func capture(_ point1: Point, by point2: Point) -> Bool {
        guard canCapture(point1, by: point2) else { return false }
        return move(point2, to: point1)
    }
    
    @discardableResult
    func canMove(_ point1: Point, to point2: Point) -> Bool {
        guard let piece1 = toPiece(point1) else { return false }
        return movablePoints(piece1).contains(point2)
    }
    
    @discardableResult
    func canCapture(_ point1: Point, by point2: Point) -> Bool {
        guard let piece1 = toPiece(point1), let _ = toPiece(point2) else { return false }
        return movablePoints(piece1).contains(point2)
    }
    
    func calculateScore(option: ScoreManager.ScoreOptions) -> Int {
        return scoreManager.caculateScore(board: data, option: option)
    }
    
    func movablePoints(_ piece: Piece) -> [Point] {
        
        var check = Set<Point>()
        
        return piece.steps
            .map { step in
                check.removeAll()
                check.insert(piece.point)
                return dfs(piece.point, piece.color, step, piece.maxStepDistance)
            }
            .flatMap { $0 }
        
        func dfs(_ point: Point, _ color: Piece.Color, _ step: Tuple, _ depth: Int) -> [Point] {
            if depth <= 0 {
                return []
            }
            guard let newPoint = point + step, !check.contains(newPoint) else {
                return []
            }
            if let newPiece = toPiece(newPoint), newPiece.color == color {
                return []
            }
            check.insert(newPoint)
            if let newPiece = toPiece(newPoint), newPiece.color != color {
                return [newPoint]
            }
            return [newPoint] + dfs(newPoint, color, step, depth - 1)
        }
    }
}
