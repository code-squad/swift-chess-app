//
//  Board.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation


final class Board {
    
    typealias BoardData = [Point: Piece]
    
    private(set) var data: BoardData = [:]
    
    var toList: [[PieceInfo?]] { makeList() }
    
    let scoreManager: ScoreManagable
    
    private(set) var state: BoardState = .init()
    
    init(scoreManager: ScoreManagable) {
        self.scoreManager = scoreManager
    }
}

extension Board {
    
    func verify(action: Action, color currentColor: Color) -> Action {
        switch action {
        case let .move(point, _), let .capture(point, _), let .help(point):
            if currentColor != toPiece(point)?.color {
                return .cancel
            }
            return action
        default:
            return action
        }
    }
    
    func transform(action: Action) -> Action {
        switch action {
        case let .move(from, to):
            if canCapture(from, to) {
                return .capture(from, to)
            }
            if canMove(from, to: to) {
                return action
            }
            return .cancel
            
        default:
            return action
        }
    }
    
    func toPiece(_ point: Point) -> Piece? { data[point] }
    
    func set(pieces: [Piece]) {
        data = Dictionary(uniqueKeysWithValues: pieces.map { ($0.point, $0) })
    }
    
    func set(point: Point, piece: Piece?) {
        var newPiece = piece
        newPiece?.point = point
        data[point] = newPiece
    }
    
    func set(state: BoardState) {
        self.state = state
    }
    
    @discardableResult
    func move(_ from: Point, to: Point) -> Bool {
        guard canMove(from, to: to) else { return false }
        set(point: to, piece: toPiece(from))
        set(point: from, piece: nil)
        return true
    }
    
    @discardableResult
    func capture(_ point1: Point, _ point2: Point) -> Bool {
        guard canCapture(point1, point2) else { return false }
        return move(point1, to: point2)
    }
    
    func help(_ point: Point) {
        state = .help(point)
    }
    
    func canMove(_ point1: Point, to point2: Point) -> Bool {
        guard let piece1 = toPiece(point1) else { return false }
        return movablePoints(piece1).contains(point2)
    }
    
    func canCapture(_ point1: Point, _ point2: Point) -> Bool {
        guard let piece1 = toPiece(point1), let _ = toPiece(point2) else { return false }
        return movablePoints(piece1).contains(point2)
    }
    
    func calculateScore(option: ScoreOptions) -> Int {
        return scoreManager.caculateScore(list: toList, option: option)
    }
    
    func movablePoints(_ piece: Piece) -> [Point] {
        var check = Set<Point>()
        
        return piece.steps
            .map { step -> [Point] in
                check.removeAll()
                check.insert(piece.point)
                return dfs(piece.point, piece.color, step, piece.maxStepDistance, &check)
            }
            .flatMap { $0 }
    }
}

fileprivate extension Board {
    
    func dfs(_ point: Point, _ color: Color, _ step: Tuple, _ depth: Int, _ check: inout Set<Point>) -> [Point] {
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
        return [newPoint] + dfs(newPoint, color, step, depth - 1, &check)
    }
    
    func makeList() -> [[PieceInfo?]] {
        var lists = Rank.allCases.map { _ in File.allCases.map { _ -> PieceInfo? in nil } }
        
        data.forEach { lists[$0.toTuple.row][$0.toTuple.col] = PieceInfo(color: $1.color, type: type(of: $1)) }
        
        if case let .help(point) = state, let piece = toPiece(point) {
            movablePoints(piece).forEach {
                let color = toPiece($0) == nil ? piece.color : toPiece($0)!.color
                let type = toPiece($0) == nil ? type(of: piece) : type(of: toPiece($0)!)
                lists[$0.toTuple.row][$0.toTuple.col] = PieceInfo(color: color, isGuide: true, type: type)
            }
        }
        return lists
    }
}
