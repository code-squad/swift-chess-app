//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by herohjk on 2022/09/26.
//

import Foundation

typealias Score = (black: Int, white: Int)

class ChessBoard {
    var board: [[ChessUnitProtocol?]] = []
    
    var currentFaction: PlayerFaction { _currentFaction }
    var _currentFaction: PlayerFaction = .Black
    
    var clearSuccess = false
    
    init() {
        clear()
    }
    
    /// 게임을 초기화
    func clear() {
        clearSuccess = false
        
        board = [[ChessUnitProtocol?]](
            repeating: [ChessUnitProtocol?](repeating: nil, count: ChessRule.boardSize),
            count: ChessRule.boardSize
        )
        changeFaction()
        
        do {
            try createNewUnitsOnBoard()
        } catch ChessError.UnitCountNotMatch(let playerFaction, let unitType, let definedCount, let makeCount) {
            print(
                "정의된 유닛수와 매치되지 않음. \(playerFaction)의 \(unitType) 유닛" +
                " - 정의: \(definedCount) 생성 개수: \(makeCount)"
            )
        } catch ChessError.UnknownFaction(let playerFaction) {
            print("팩션이 매치되지 않음. (\(playerFaction))")
        } catch {
            print(error)
        }
        
    }
    
    /// 유닛 생성
    func createNewUnitsOnBoard() throws {
        for playerFaction in PlayerFaction.allCases {
            /// Pawn 생성
            try makePawn(playerFaction: playerFaction)
        }
    }
    
    private func makePawn(playerFaction: PlayerFaction) throws {
        var count = 0
        
        let pawnPositions = UnitRule.StartPosition.pawn(playerFaction)
        for chessPosition in pawnPositions {
            board[chessPosition.fileInt][chessPosition.rankInt] = Pawn(playerFaction: playerFaction)
            count += 1
        }
        
        guard count == UnitRule.Count.pawnCount else {
            throw ChessError.UnitCountNotMatch(playerFaction: playerFaction,
                                               unit: .Pawn,
                                               definedCount: UnitRule.Count.pawnCount,
                                               makeCount: count
            )
        }
    }
    
    func changeFaction() {
        _currentFaction = _currentFaction == .Black ? .White : .Black
    }
    
    func getScore() -> Score {
        // Dictionary 타입이라 Optional 처리가 되기는 하는데, 초기화를 해주었으므로 실질적으로 Optional이 되진 않을거로 예상
        var score = Score(0, 0)
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count where board[i][j] != nil {
                score.black += board[i][j]!.playerFaction == .Black ? 1 : 0
                score.white += board[i][j]!.playerFaction == .White ? 1 : 0
            }
        }
        
        return score
    }

    public func display() -> [String] {
        board.map { file in
            file.map { unit in
                if let unit = unit {
                    return unit.type.icon(unit.playerFaction)
                } else {
                    return "."
                }
            }.joined()
        }
    }
    
    public func moveCheck(_ currentChessPosition: ChessPosition, _ moveChessPosition: ChessPosition) -> Bool {
        // 입력받은 현재 위치에 말이 있는지
        guard let unit = board[currentChessPosition.rankInt][currentChessPosition.fileInt] else { return false }
        
        // 해당 위치로 이동이 가능한 상황인지
        if !unit.movablePaths(currentChessPosition, board).contains(moveChessPosition) { return false }
        
        // 가능하다면 true 반환
        return true
    }
    
    public func move(_ currentChessPosition: ChessPosition, _ moveChessPosition: ChessPosition) -> Bool {
        // 가능한지 먼저 검사
        guard moveCheck(currentChessPosition, moveChessPosition),
              let unit = board[currentChessPosition.fileInt][currentChessPosition.rankInt], // 유닛이 있어도, 내 말이 아니면 false
              unit.playerFaction == currentFaction else { return false }
        
        // 해당 위치에 나의 말이 없는지 검사
        if let moveUnit = board[moveChessPosition.fileInt][moveChessPosition.rankInt],
           unit.playerFaction == moveUnit.playerFaction { return false }

        // 입력받은 위치에 상대방 말이 있다면..
        if let unit = board[moveChessPosition.fileInt][moveChessPosition.rankInt], unit.playerFaction != currentFaction {
            // 삭제 및 감점
            removeUnit(moveChessPosition)
        }
        
        // 입력받은 위치의 말을 요청한 위치로 이동
        board[moveChessPosition.fileInt][moveChessPosition.rankInt] = board[currentChessPosition.fileInt][currentChessPosition.rankInt]
        board[currentChessPosition.fileInt][currentChessPosition.rankInt] = nil
        
        return true
    }
    
    private func removeUnit(_ chessPosition: ChessPosition) {
        // TODO: 추후에 삭제될때 일어나는 룰 추가 필요. 현재는 Pawn만 구현이기에 생략
        board[chessPosition.fileInt][chessPosition.rankInt] = nil
    }
}
