//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

// TODO: pawn 이동에 맞게 matrix 값 변경 해주기
class ChessBoard {
    enum Dimension {
        enum Size {
            static let rank: Int = 8
            static let file: Int = 8
        }
    }
    
    private var matrix: [[Bool]]
    private var blackPawns: [Pawn] = []
    private var whitePawns: [Pawn] = []
    
    init() {
        let rank: [Bool] = Array(repeating: false, count: Dimension.Size.rank)
        self.matrix = Array(repeating: rank, count: Dimension.Size.file)
    }
    
    func createPawns(color: Pawn.Color, positions: [Position]) {
        let pawns = positions.map({ Pawn(color: color, position: $0) })
        
        if color == .black {
            self.blackPawns = pawns
        } else {
            self.whitePawns = pawns
        }
    }
    
    func createPawn(color: Pawn.Color, position: Position) {
        let pawn = Pawn(color: color, position: position)
        
        if color == .black {
            self.blackPawns.append(pawn)
        } else {
            self.whitePawns.append(pawn)
        }
    }
    
    func myPawns(color: Pawn.Color) -> [Pawn] {
        let pawns = color == .black ? self.blackPawns : self.whitePawns
        return pawns
    }
    
    @discardableResult
    func movePawn(color: Pawn.Color, from: Position, to: Position) -> Bool {
        guard var targetPawn = findPawn(color: color, position: from) else { return false }
        targetPawn.move(to)
        
        return true
    }
    
    func display() {
        // display board
    }
    
    private func findPawn(color: Pawn.Color , position: Position) -> Pawn? {
        let pawns = color == .black ? self.blackPawns : self.whitePawns
        return pawns.first(where: { $0.position == position })
    }
    
    private func checkHitPawn(color: Pawn.Color ,position: Position) -> Pawn? {
        let targetPawns = color == .black ? self.whitePawns : self.blackPawns
        
        return targetPawns.first(where: { $0.position == position })
    }
    
}
