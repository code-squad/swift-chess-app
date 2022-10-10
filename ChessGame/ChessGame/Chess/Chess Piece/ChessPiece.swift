//
//  ChessPiece.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/01.
//

import Foundation

protocol ChessPiece {
    var teamColor: TeamColor { get }
    static var score: Int { get }
    var symbol: Character { get }
    
    init(teamColor: TeamColor)
    
    func isDeltaValid(delta: Delta) -> Bool
    
    func steppingPositions(origin: Position, destination: Position) -> [Position]
    
    /// 움직이기 전 보드의 상태를 확인해야 할 경우 추가로 구현해야하는 함수
    ///
    /// 이 함수는 보드의 각 포지션에 접근할 수 있는지 검증이 된 후 실행되기 떄문에 보드에 접근할 수 있는지 확인할 필요가 없다.
    ///
    /// 검증되는 항목들 (순서대로 실행됨)
    ///
    /// - 두 포지션이 같지 않음
    /// - 시작점에 접근할 수 있음
    /// - 목적지에 접근할 수 있음
    /// - 시작점에 기물이 있음
    /// - 시작점 기물의 타입이 함수가 소속된 타입과 동일함
    /// - 시작점 기물과 목적지 기물의 팀 색상이 다름
    /// - 해당 기물의 이동가능범위 내에서 이동함 (isDeltaValid)
    func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool
}

extension ChessPiece {
    func steppingPositions(origin: Position, destination: Position) -> [Position] {
        return []
    }
    
    func isMovementValid(origin: Position, destination: Position, board: ChessBoard) -> Bool {
        return true
    }
}
