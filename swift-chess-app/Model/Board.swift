//
//  Board.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

class Board {
    var board: [[ChessUnitProtocol?]] = []
    
    var currentFaction: PlayerFaction = .Black
    
    init() {
        clear()
    }
    
    /// 게임을 초기화
    func clear() {
        board = [[ChessUnitProtocol?]](repeating: [ChessUnitProtocol?](repeating: nil, count: ChessRule.boardSize), count: ChessRule.boardSize)
        currentFaction = .Black
        
        createNewUnitsOnBoard()
    }
    
    /// 유닛 생성
    func createNewUnitsOnBoard() {
        PlayerFaction.allCases.forEach {
            /// Pawn 생성
            var count = 0
            for i in 0 ..< ChessRule.boardSize { /// 체스판의 file길이와 pawn의 개수는 같기때문에 따로 검증하지 않습니다.
                guard let pawnPosition = UnitRule.pawnPosition[$0] else { fatalError("Pawn 생성 실패.") }
                if board[pawnPosition][i] == nil {
                    board[pawnPosition][i] = Pawn(faction: $0)
                }
                count += 1
            }
            guard count == UnitRule.pawnCount else { fatalError("Pawn 생성 실패. (\($0.rawValue)색 Pawn)") }
        }
    }
    
    func factionChange() {
        currentFaction = currentFaction == .Black ? .White : .Black
    }
    
    func getScore() -> (black: Int, white: Int) {
        // Dictionary 타입이라 Optional 처리가 되기는 하는데, 초기화를 해주었으므로 실질적으로 Optional이 되진 않을거로 예상
        var score: [PlayerFaction: Int] = [.Black: 0, .White: 0]
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count where board[i][j] != nil {
                score[board[i][j]!.faction]? += 1
            }
        }
        
        return (black: score[.Black] ?? 0, white: score[.White] ?? 0)
    }

    public func display() -> [String] {
        board.map { file in
            file.map { unit in
                if let unit = unit {
                    return unit.type.icon(unit.faction)
                } else {
                    return "."
                }
            }.joined()
        }
    }
    
    public func moveCheck(_ current: ChessPosition, _ move: ChessPosition) -> Bool {
        // 입력받은 현재 위치에 말이 있는지
        guard let unit = board[current.rank][current.file] else { return false }
        
        // 해당 위치로 이동이 가능한 상황인지
        if !unit.movablePaths(current).contains(move) { return false }
        
        // 가능하다면 true 반환
        return true
    }
    
    public func move(_ current: ChessPosition, _ move: ChessPosition) -> Bool {
        // 가능한지 먼저 검사
        guard moveCheck(current, move),
              let unit = board[current.rank][current.file], // 유닛이 있어도, 내 말이 아니면 false
              unit.faction == currentFaction else { return false }
        
        // 해당 위치에 나의 말이 없는지 검사
        if let moveUnit = board[move.rank][move.file],
           unit.faction == moveUnit.faction { return false }

        // 입력받은 위치에 상대방 말이 있다면..
        if let unit = board[move.rank][move.file], unit.faction != currentFaction {
            // 삭제 및 감점
            removeUnit(move)
        }
        
        // 입력받은 위치의 말을 요청한 위치로 이동
        board[move.rank][move.file] = board[current.rank][current.file]
        board[current.rank][current.file] = nil
        
        return true
    }
    
    private func removeUnit(_ position: ChessPosition) {
        // TODO: 추후에 삭제될때 일어나는 룰 추가 필요. 현재는 Pawn만 구현이기에 생략
        board[position.rank][position.file] = nil
    }
}
