//
//  RankManager.swift
//  SwiftChessApp
//
//  Created by YoungsunMoon on 2022/09/29.
//

import Foundation

protocol RankManager {
    static func generateRanks(whiteRanks: [Int], blackRanks: [Int]) -> [Rank]
    func score() -> (whiteScore: Int, blackScore: Int)
    func rankDescriptions() -> [String]
}

class RankManagerImpl: RankManager {
    
    private var ranks: [Rank]
    
    init(whiteRanks: [Int], blackRanks: [Int]) {
        self.ranks = RankManagerImpl.generateRanks(
            whiteRanks: whiteRanks,
            blackRanks: blackRanks
        )
    }
    
    static func generateRanks(whiteRanks: [Int], blackRanks: [Int]) -> [Rank] {
        return (1..<9).map {
            var pawnColor: Pawn.Color? = nil
            if whiteRanks.contains($0) {
                pawnColor = .white
            } else if blackRanks.contains($0) {
                pawnColor = .black
            }
            return generateRank(pawnColor: pawnColor)
        }
    }
    
    private static func generateRank(pawnColor: Pawn.Color?) -> Rank {
        return Rank(pieces: File.allCases.map { Piece(pawn: Pawn(color: pawnColor), file: $0) })
    }
    
    func score() -> (whiteScore: Int, blackScore: Int) {
        let pawns = ranks.flatMap { $0.pieces.compactMap { $0.pawn }}
        let whiteScore = pawns.filter { $0.color == .white }.count
        let blackScore = pawns.filter { $0.color == .black }.count
        return (whiteScore, blackScore)
    }
    
    func rankDescriptions() -> [String] {
        return ranks.map { $0.pieces.map { $0.description }.joined() }
    }
}
