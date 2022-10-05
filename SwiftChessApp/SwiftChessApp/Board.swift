//
//  Board.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation

protocol BoardPositionable {
    func availablePositions(from current: Board.Position, on board: [Board.Position: Piece]) -> [Board.Position]
}

final class Board {
    struct Position: Hashable {
        let x: File
        let y: Rank
    }

    struct Score {
        let black: Int
        let white: Int
    }

    enum Rank: CaseIterable {
        case one, two, three, four, five, six, seven, eight

        static let minCoordinate: Int = Rank.one.coordinate
        static let maxCoordinate: Int = Rank.eight.coordinate

        init?(value: String) {
            switch value {
            case "1": self = .one
            case "2": self = .two
            case "3": self = .three
            case "4": self = .four
            case "5": self = .five
            case "6": self = .six
            case "7": self = .seven
            case "8": self = .eight
            default: return nil
            }
        }

        init?(coordinate: Int) {
            switch coordinate {
            case 1: self = .one
            case 2: self = .two
            case 3: self = .three
            case 4: self = .four
            case 5: self = .five
            case 6: self = .six
            case 7: self = .seven
            case 8: self = .eight
            default: return nil
            }
        }

        var coordinate: Int {
            switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            case .four: return 4
            case .five: return 5
            case .six: return 6
            case .seven: return 7
            case .eight: return 8
            }
        }
    }

    enum File: CaseIterable {
        case A, B, C, D, E, F, G, H

        static let minCoordinate: Int = File.A.coordinate
        static let maxCoordinate: Int = File.H.coordinate

        init?(value: String) {
            switch value {
            case "A": self = .A
            case "B": self = .B
            case "C": self = .C
            case "D": self = .D
            case "E": self = .E
            case "F": self = .F
            case "G": self = .G
            case "H": self = .H
            default: return nil
            }
        }

        init?(coordinate: Int) {
            switch coordinate {
            case 1: self = .A
            case 2: self = .B
            case 3: self = .C
            case 4: self = .D
            case 5: self = .E
            case 6: self = .F
            case 7: self = .G
            case 8: self = .H
            default: return nil
            }
        }

        var coordinate: Int {
            switch self {
            case .A: return 1
            case .B: return 2
            case .C: return 3
            case .D: return 4
            case .E: return 5
            case .F: return 6
            case .G: return 7
            case .H: return 8
            }
        }
    }

    private var board: [Position: Piece] = [:]

    func newGame() {
        board.removeAll()

        board[Position(x: .A, y: .one)] = Rook(color: .black)
        board[Position(x: .B, y: .one)] = Knight(color: .black)
        board[Position(x: .C, y: .one)] = Bishop(color: .black)
//        board[Position(x: .D, y: .one)] = King(color: .black)
        board[Position(x: .E, y: .one)] = Queen(color: .black)
        board[Position(x: .F, y: .one)] = Bishop(color: .black)
        board[Position(x: .G, y: .one)] = Knight(color: .black)
        board[Position(x: .H, y: .one)] = Rook(color: .black)
        board[Position(x: .A, y: .two)] = Pawn(color: .black)
        board[Position(x: .B, y: .two)] = Pawn(color: .black)
        board[Position(x: .C, y: .two)] = Pawn(color: .black)
        board[Position(x: .D, y: .two)] = Pawn(color: .black)
        board[Position(x: .E, y: .two)] = Pawn(color: .black)
        board[Position(x: .F, y: .two)] = Pawn(color: .black)
        board[Position(x: .G, y: .two)] = Pawn(color: .black)
        board[Position(x: .H, y: .two)] = Pawn(color: .black)

        board[Position(x: .A, y: .seven)] = Pawn(color: .white)
        board[Position(x: .B, y: .seven)] = Pawn(color: .white)
        board[Position(x: .C, y: .seven)] = Pawn(color: .white)
        board[Position(x: .D, y: .seven)] = Pawn(color: .white)
        board[Position(x: .E, y: .seven)] = Pawn(color: .white)
        board[Position(x: .F, y: .seven)] = Pawn(color: .white)
        board[Position(x: .G, y: .seven)] = Pawn(color: .white)
        board[Position(x: .H, y: .seven)] = Pawn(color: .white)
        board[Position(x: .A, y: .eight)] = Rook(color: .white)
        board[Position(x: .B, y: .eight)] = Knight(color: .white)
        board[Position(x: .C, y: .eight)] = Bishop(color: .white)
//        board[Position(x: .D, y: .eight)] = King(color: .white)
        board[Position(x: .E, y: .eight)] = Queen(color: .white)
        board[Position(x: .F, y: .eight)] = Bishop(color: .white)
        board[Position(x: .G, y: .eight)] = Knight(color: .white)
        board[Position(x: .H, y: .eight)] = Rook(color: .white)
    }

    func display() -> [String] {
        var result: [String] = []
        for rank in Rank.allCases {
            var rankDisplay: String = ""
            for file in File.allCases {
                if let piece = board[.init(x: file, y: rank)] {
                    rankDisplay += piece.image
                } else {
                    rankDisplay += "."
                }
            }
            result.append(rankDisplay)
        }
        return result
    }

    @discardableResult
    func move(from: Position, to: Position) -> Bool {
        guard let piece = board.removeValue(forKey: from) else { return false }
        let availablePositions = piece.availablePositions(from: from, on: board)
        var result: Bool = false
        for position in availablePositions {
            if position == to {
                board[to] = piece
                result = true
                break
            }
        }
        return result
    }

    func score() -> Score {
        var black: Int = 0
        var white: Int = 0
        for (_, v) in board {
            if v.color == .black {
                black += v.value
            } else {
                white += v.value
            }
        }
        return Score(black: black, white: white)
    }

    func pick(_ position: Position) -> Piece? {
        board[position]
    }
}
