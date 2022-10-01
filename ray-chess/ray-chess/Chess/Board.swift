//
//  Board.swift
//  ray-chess
//
//  Created by 김상진 on 2022/09/24.
//

import Foundation

// - matrix를 통한 말 위치 관리
// - 말 셋팅 관리
// - 말 움직임 관리
class Board {
    private(set) var matrix: [[Piecable?]]
    
    init() {
        let rank = Array<Piecable?>(repeating: nil, count: 8)
        self.matrix = Array(repeating: rank, count: 8)
    }
    
    func showScore() {
        //
    }
    
    func display() {
        matrix.forEach { rank in
            print(rank)
        }
    }
}

// MARK: - Pawn initialize
extension Board {
    func canSetPawn(pawn: Pawn) -> Bool {
        guard isCorrectRankPosition(piece: pawn) else {
            return false
        }
        guard IsEmptyPosition(position: pawn.position) else {
            return false
        }
        guard !IsOverPawnMaxCount(color: pawn.color) else {
            return false
        }
        
        return true
    }
    
    func isCorrectRankPosition(piece: Piece) -> Bool {
        let rank = piece.position.rank
        
        switch piece.getColor() {
        case .white:
            if rank == .seven || rank == .eight {
                return true
            }
        case .black:
            if rank == .one || rank == .two {
                return true
            }
        }
        
        return false
    }
    
    func IsEmptyPosition(position: Piece.Position) -> Bool {
        // piece를 파라미터로 받는게 좋을까?
        let piece = getPieceOnBoard(position: position)
        
        if piece == nil {
            return true
        } else {
            return false
        }
    }
    
    func IsOverPawnMaxCount(color: Piece.Color) -> Bool {
        switch color {
        case .white:
            if theNumberOfWhitePawn() > PawnConst.maxCount {
                return true
            }
        case .black:
            if theNumberOfBlackPawn() > PawnConst.maxCount {
                return true
            }
        }
        return false
    }
    
    func theNumberOfWhitePawn() -> Int {
        var num: Int = 0
        matrix.forEach { ranks in
            ranks.forEach { piece in
                if piece?.color == .white {
                    num += 1
                }
            }
        }
        return num
    }
    
    func theNumberOfBlackPawn() -> Int {
        var num: Int = 0
        matrix.forEach { ranks in
            ranks.forEach { piece in
                if piece?.color == .black {
                    num += 1
                }
            }
        }
        return num
    }
}

// MARK: - Pawn move
extension Board {
    func canMovePawn(from: Piece.Position, to: Piece.Position, currentColor: Piece.Color) -> Bool {
        guard isMyPiece(from: from, currentColor: currentColor) else {
            return false
        }
        guard !existSameColorPiece(from: from, to: to) else {
            return false
        }
        guard isReachablePosition(from: from, to: to, currentColor: currentColor) else {
            return false
        }
        
        return true
    }
    
    func movePawn(from: Piece.Position, to: Piece.Position) {
        var pawn = getPieceOnBoard(position: from)
        pawn?.position = to
        setPieceOnBoard(position: to, piece: pawn)
        
        setPieceOnBoard(position: from, piece: nil)
    }
    
    func isMyPiece(from: Piece.Position, currentColor: Piece.Color) -> Bool {
        guard let fromPiece = getPieceOnBoard(position: from) else {
            return false
        }
        
        if fromPiece.color == currentColor {
            return true
        } else {
            return false
        }
    }
    
    func existSameColorPiece(from: Piece.Position, to: Piece.Position) -> Bool {
        let fromPiece = getPieceOnBoard(position: from)
        let toPiece = getPieceOnBoard(position: to)
        
        if fromPiece?.color == toPiece?.color {
            return true
        } else {
            return false
        }
    }
    
    func isOneStepFoward(from: Piece.Position, to: Piece.Position, currentColor: Piece.Color) -> Bool {
        if from.file == to.file {
            switch currentColor {
            case .white:
                if (to.rank.rawValue - from.rank.rawValue) == -1 {
                    return true
                }
            case .black:
                if (to.rank.rawValue - from.rank.rawValue) == 1 {
                    return true
                }
            }
        }
        
        return false
    }
}


// MARK: - Matrix Common
extension Board {
    func getPieceOnBoard(position: Piece.Position) -> Piecable? {
        return matrix[position.rank.rawValue][position.file.rawValue]
    }
    
    @discardableResult
    func setPieceOnBoard(position: Piece.Position, piece: Piecable?) -> Bool {
        matrix[position.rank.rawValue][position.file.rawValue] = piece
        return true
    }
}
