//
//  ChessUnitMovable.swift
//  swift-chess-app
//
//  Created by 김호종 on 2022/10/03.
//

import Foundation

/// 직선, 대각선을 위한 함수 모음
struct ChessUnitMovable {
    static func straight(_ currentPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition] {
        var chessPositions = [ChessPosition]()
        
        let rank = currentPosition.rankInt
        let file = currentPosition.fileInt
        
        // 위쪽 체크
        for i in (0 ..< file).reversed() {
            if let chessPosition = ChessPosition(rank: rank, file: i) {
                chessPositions.append(chessPosition)
            }
            
            if board[i][rank] != nil { break }
        }
        
        // 아래쪽 체크
        for i in (file + 1 ..< ChessRule.boardSize) {
            if let chessPosition = ChessPosition(rank: rank, file: i) {
                chessPositions.append(chessPosition)
            }
            
            if board[i][rank] != nil { break }
        }
        
        // 왼쪽 체크
        for i in (0 ..< rank).reversed() {
            if let chessPosition = ChessPosition(rank: i, file: file) {
                chessPositions.append(chessPosition)
            }
            
            if board[file][i] != nil { break }
        }
        
        // 오른쪽 체크
        for i in (rank + 1 ..< ChessRule.boardSize) {
            if let chessPosition = ChessPosition(rank: i, file: file) {
                chessPositions.append(chessPosition)
            }
            
            if board[file][i] != nil { break }
        }
        
        return chessPositions
    }
    
    /// ChessPosition의 rank와 file은 추후 혹시 모를 상황을 대비해서 상수로 고정시켜 두었습니다.
    /// 하지만 Movable 값을 구하는 경우 상수가 아닌 변수가 필요할 수 있는데요,
    /// 그래서 임시로 타입을 정의합니다. 만약 이런 경우가 더 생긴다면, ChessPosition 자체를 수정할 필요가 있어 보입니다.
    private typealias MovableChessPosition = (rank: Int, file: Int)
    
    static func diagonal(_ currentPosition: ChessPosition, _ board: [[ChessUnitProtocol?]]) -> [ChessPosition] {
        var chessPositions = [ChessPosition]()
        
        // 왼쪽 위 체크
        var position = MovableChessPosition(rank: currentPosition.rankInt - 1, file: currentPosition.fileInt - 1)
        
        while position.rank >= 0 && position.file >= 0 {
            if let chessPosition = ChessPosition(rank: position.rank, file: position.file) {
                chessPositions.append(chessPosition)
            }
            
            if board[position.file][position.rank] != nil { break }
            
            position.rank -= 1
            position.file -= 1
        }
        
        // 오른쪽 위 체크
        position = MovableChessPosition(rank: currentPosition.rankInt - 1, file: currentPosition.fileInt + 1)
        
        while position.rank >= 0 && position.file < 8 {
            if let chessPosition = ChessPosition(rank: position.rank, file: position.file) {
                chessPositions.append(chessPosition)
            }
            
            if board[position.file][position.rank] != nil { break }
            
            position.rank -= 1
            position.file += 1
        }
        
        // 왼쪽 아래 체크
        position = MovableChessPosition(rank: currentPosition.rankInt + 1, file: currentPosition.fileInt - 1)
        
        while position.rank < 8 && position.file >= 0 {
            if let chessPosition = ChessPosition(rank: position.rank, file: position.file) {
                chessPositions.append(chessPosition)
            }
            
            if board[position.file][position.rank] != nil { break }
            
            position.rank += 1
            position.file -= 1
        }
        
        // 오른쪽 아래 체크
        position = MovableChessPosition(rank: currentPosition.rankInt + 1, file: currentPosition.fileInt + 1)
        
        while position.rank < 8 && position.file < 8 {
            if let chessPosition = ChessPosition(rank: position.rank, file: position.file) {
                chessPositions.append(chessPosition)
            }
            
            if board[position.file][position.rank] != nil { break }
            
            position.rank += 1
            position.file += 1
        }
        
        return chessPositions
    }
}
