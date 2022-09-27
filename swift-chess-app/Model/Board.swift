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
    
    func factionChange() {
        currentFaction = currentFaction == .Black ? .White : .Black
    }
    
    
    /// 게임을 초기화
    func clear() {
        board = [[ChessUnitProtocol?]](repeating: [ChessUnitProtocol?](repeating: nil, count: ChessRule.boardSize), count: ChessRule.boardSize)
        currentFaction = .Black
        
        initUnits()
    }
    
    func initUnits() {
        /// 유닛 생성
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
    
    func getScore() -> (black: Int, white: Int) {
        var black = 0
        var white = 0
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                if let unit = board[i][j] {
                    black += unit.faction == .Black ? 1 : 0
                    white += unit.faction == .White ? 1 : 0
                }
            }
        }
        
        return (black: black, white: white)
    }
    
    public func display() -> String {
        var displayString = " ABCDEFGH\n"

        for i in 0 ..< ChessRule.boardSize {
            let rank = board[i].map { unit in
                if let unit = unit {
                    return unit.type.icon(unit.faction)
                } else {
                    return "."
                }
            }.joined()
            
            displayString += "\(i + 1)\(rank)\n"
        }
        
        displayString += " ABCDEFGH"
        
        return displayString
    }
    
    public func moveCheck(_ current: ChessPosition, _ move: ChessPosition) -> Bool {
        // 입력받은 현재 위치에 말이 있는지
        guard let unit = board[current.rank][current.file] else { return false }
        
        // 그 말이 나의 말인지
        if currentFaction != unit.faction { return false }
        
        // 해당 위치로 이동이 가능한 상황인지
        if !unit.movablePaths(current).contains(move) { return false }
        
        // 해당 위치에 나의 말이 없는지
        if let moveUnit = board[move.rank][move.file], moveUnit.faction == currentFaction { return false }
        
        // 가능하다면 true 반환
        return true
    }
    
    public func move(_ current: ChessPosition, _ move: ChessPosition) {
        // 입력받은 위치의 말을 요청한 위치로 이동
        
        // 입력받은 위치에 상대방 말이 있다면..
        if let unit = board[move.rank][move.file], unit.faction != currentFaction {
            // 삭제 및 감점
            removeUnit(move)
        }
        
        board[move.rank][move.file] = board[current.rank][current.file]
        board[current.rank][current.file] = nil
    }
    
    private func removeUnit(_ position: ChessPosition) {
        // TODO: 추후에 삭제될때 일어나는 룰 추가 필요. 현재는 Pawn만 구현이기에 생략
        board[position.rank][position.file] = nil
    }
}
