//
//  ChessGame.swift
//  ray-chess
//
//  Created by 김상진 on 2022/09/26.
//

import Foundation

// - 체스판 초기화
// - 입/출력 관리
class ChessGame {
    
    let board = Board()
    
    init() {
        self.initBlackPawn()
        self.initWhitePawn()
    }
    
    func initBlackPawn() {
        File.allCases.forEach { file in
            let pawn = Pawn(color: .black, position: Piece.Position(rank: .two, file: file))
            
            if board.canSetPawn(pawn: pawn) {
                board.setPieceOnBoard(position: pawn.position, piece: pawn)
            }
        }
    }
    
    func initWhitePawn() {
        File.allCases.forEach { file in
            let pawn = Pawn(color: .white, position: Piece.Position(rank: .seven, file: file))
            
            if board.canSetPawn(pawn: pawn) {
                board.setPieceOnBoard(position: pawn.position, piece: pawn)
            }
        }
    }
    
}
