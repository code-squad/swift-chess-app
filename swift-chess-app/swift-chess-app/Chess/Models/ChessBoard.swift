//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

class ChessBoard {
    private var blackPawns: [Pawn] = []
    private var whitePawns: [Pawn] = []
    
    func createPawns(color: Pawn.Color, positions: [Position]) {
        let pawns = positions.map({ Pawn(color: color, position: $0) })
        
        if color == .black {
            self.blackPawns = pawns
        } else {
            self.whitePawns = pawns
        }
    }
    
    func myPawns(color: Pawn.Color) -> [Pawn] {
        let pawns = color == .black ? self.blackPawns : self.whitePawns
        return pawns
    }
    
    @discardableResult
    func movePawn(color: Pawn.Color, from: Position, to: Position) -> Bool {
        guard var targetPawn = findPawn(color: color, position: from),
              let _ = removePawn(color: color, pawn: targetPawn) else { return false }
        targetPawn.move(to)
        self.addPawn(color: color, pawn: targetPawn)
        return true
    }
    
    @discardableResult
    func removePawn(color: Pawn.Color , pawn: Pawn) -> Pawn? {
        if color == .black {
            guard let index = blackPawns.firstIndex(where: { $0 == pawn }) else { return nil }
            return blackPawns.remove(at: index)
        } else {
            guard let index = whitePawns.firstIndex(where: { $0 == pawn }) else { return nil }
            return whitePawns.remove(at: index)
        }
    }
    
    private func addPawn(color: Pawn.Color , pawn: Pawn) {
        if color == .black {
            self.blackPawns.append(pawn)
        } else {
            self.whitePawns.append(pawn)
        }
    }
    
    func findPawn(color: Pawn.Color , position: Position) -> Pawn? {
        let pawns = color == .black ? self.blackPawns : self.whitePawns
        return pawns.first(where: { $0.position == position })
    }
    
    func checkHitPawn(color: Pawn.Color, position: Position) -> Pawn? {
        let targetPawns = color == .black ? self.whitePawns : self.blackPawns
        return targetPawns.first(where: { $0.position == position })
    }
    
    func display() {
        var matrix: [[Pawn?]]
        let rank: [Pawn?] = Array(repeating: nil, count: 8)
        matrix = Array(repeating: rank, count: 8)
        
        self.whitePawns.forEach({ whitePawn in
            matrix[whitePawn.position.rank.rawValue - 1][whitePawn.position.file.rawValue - 1] = whitePawn
        })
        
        self.blackPawns.forEach({ blackPawn in
            matrix[blackPawn.position.rank.rawValue - 1][blackPawn.position.file.rawValue - 1] = blackPawn
        })
        
        var string = ""
        string += File.allCases.map{ $0.invertedTypeString }.reduce(" ", { $0 + $1 })
        string += "\n"
        
        Rank.allCases.forEach({ rank in
            string += "\(rank.invertedTypeString)"
            string +=  matrix[rank.rawValue - 1]
                .map({
                    if let pawn = $0 { return pawn.color == .black ? "♟" : "♙" }
                    else { return "." }
                })
                .reduce("", { $0 + $1 })
            string += "\n"
        })
        
        string += File.allCases.map{ $0.invertedTypeString }.reduce(" ", { $0 + $1 })
        
        print(string)
    }
}
