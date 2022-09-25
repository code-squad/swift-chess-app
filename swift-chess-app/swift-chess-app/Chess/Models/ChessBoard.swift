//
//  ChessBoard.swift
//  swift-chess-app
//
//  Created by USER on 2022/09/26.
//

import Foundation

enum Rank: Int, CaseIterable {
    case a = 1, b, c, d, e, f, g, h
    
    var invertedTypeString: String {
        switch self {
        case .a:        return "A"
        case .b:        return "B"
        case .c:        return "C"
        case .d:        return "D"
        case .e:        return "E"
        case .f:        return "F"
        case .g:        return "G"
        case .h:        return "H"
        }
    }
}

enum File: Int {
    case one = 1, two, three, four, five, six, seven, eight
    
    var invertedTypeString: String {
        switch self {
        case .one:          return "1"
        case .two:          return "2"
        case .three:        return "3"
        case .four:  	    return "4"
        case .five:  	    return "5"
        case .six:  	    return "6"
        case .seven:  	    return "7"
        case .eight:  	    return "8"
        }
    }
}

struct Position: CustomStringConvertible, Equatable {
    let file: File
    let rank: Rank
    
    var description: String {
        return "\(rank.invertedTypeString)\(file.invertedTypeString)"
    }
}

struct Pawn {
    enum Color {
        case white, black
    }
    
    let id: UUID
    let color: Color
    var position: Position
    
    init(color: Color, position: Position) {
        self.id = UUID()
        self.color = color
        self.position = position
    }
    
    mutating func move(_ position: Position) {
        self.position = position
    }
}

class ChessBoard {
    enum Dimension {
        enum Size {
            static let rank: Int = 8
            static let file: Int = 8
        }
    }
    
    var matrix: [[Bool]]
    
    init() {
        let rank: [Bool] = Array(repeating: false, count: Dimension.Size.rank)
        self.matrix = Array(repeating: rank, count: Dimension.Size.file)
    }
}


// TODO: - ChessGame / ChessBoard 역할 나누기 (ChessGame은 턴 관리 및 폰 커맨드 관리, ChessBoard는 폰 위치 및 출력 관리)
class ChessGame {
    typealias Player = Pawn.Color
    
    enum Dimesion {
        static let pawnNumberOfStart = 8
    }
    
    let board = ChessBoard()
    var blackPawns: [Pawn]
    var whitePawns: [Pawn]
    private var currentPalyer: Player = .black
    
    init() {
        self.blackPawns = Self.startPositionOfBlackPawns().map({ Pawn(color: .black,
                                                                       position: $0) })
        
        
        self.whitePawns = Self.startPositionOfWhitePawns().map({ Pawn(color: .white,
                                                                       position: $0) })
    }
    
    private func changeTurnPalyer() {
        let turnPalyer: Pawn.Color = currentPalyer == .black ? .white : .black
        self.currentPalyer = turnPalyer
    }
    
    // 폰은 직선 1칸만 이동 가능 (file +- 1) || (rank +- 1)
    private func checkValidatePosition(from: Position, to: Position) -> Bool {
        return true
    }
    
    private func findPawn(player: Player , position: Position) -> Pawn? {
        let pawns = player == .black ? self.blackPawns : self.whitePawns
        return pawns.first(where: { $0.position == position })
    }
    
    @discardableResult
    func movePawn(from: Position, to: Position) -> Bool {
        guard checkValidatePosition(from: from, to: to),
              var targetPawn = findPawn(player: currentPalyer, position: from) else { return false }
        
        targetPawn.move(to)
        return true
    }
    
    private func checkHitPawn(player: Player ,position: Position) -> Pawn? {
        let targetPawns = player == .black ? self.whitePawns : self.blackPawns
        
        return targetPawns.first(where: { $0.position == position })
    }
    
    
    func score(player: Player) -> Int {
        let score = player == .black ? self.blackPawns.count : self.whitePawns.count
        return score
    }
    
    // 초기 생성 위치는 흑색은 2-rank 또는 백색 7-rank에만 가능하다.
    static func startPositionOfBlackPawns() -> [Position] {
        return Rank.allCases.map({ Position(file: .two, rank: $0) })
    }
    
    static func startPositionOfWhitePawns() -> [Position] {
        return Rank.allCases.map({ Position(file: .seven, rank: $0) })
    }
}

