//
//  Board.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/27.
//

import Foundation
import SwiftUI

protocol BoardPositionable {
    func availablePositions(from current: Position, on board: [Position: Piece]) -> [Position]
}

final class Board: ObservableObject {
    struct Score {
        let black: Int
        let white: Int
    }

    enum TileStatus {
        case picked
        case movable
        case normal
    }

    let allPositions: [Position] = {
        var positions: [Position] = []
        Position.File.allCases.forEach { file in
            Position.Rank.allCases.forEach { rank in
                positions.append(.init(x: file, y: rank))
            }
        }
        return positions
    }()

    private let blackPlayer: Player = BlackPlayer()
    private let whitePlayer: Player = WhitePlayer()
    private lazy var player: Player = whitePlayer

    @Published private(set) var pieces: [Position: Piece] = [:]
    @Published private(set) var tilesStatus: [Position: TileStatus] = [:]
    private var pickedPosition: Position? = nil

    init() {
        newGame()
    }

    func newGame() {
        pieces.removeAll()
        pieces = [blackPlayer, whitePlayer].reduce([Position: Piece](), { partialResult, player in
            var result = partialResult
            result.merge(player.initialPieces.reduce([Position: Piece]()) { partialResult, pieceType in
                var result = partialResult
                result.merge(pieceType.createOnStartPositions()) { (c, _) in c }
                return result
            }) { (c, _) in c }
            return result
        })
        refreshTilesStatus()
    }

    func display() -> [String] {
        var result: [String] = []
        for rank in Position.Rank.allCases {
            var rankDisplay: String = ""
            for file in Position.File.allCases {
                if let piece = pieces[.init(x: file, y: rank)] {
                    rankDisplay += piece.symbol
                } else {
                    rankDisplay += "."
                }
            }
            result.append(rankDisplay)
        }
        return result
    }

    @discardableResult
    func move(to: Position) -> Bool {
        guard
            let from = pickedPosition,
            let piece = pieces.removeValue(forKey: from)
        else { return false }
        let availablePositions = piece.availablePositions(from: from, on: pieces)
        var result: Bool = false
        for position in availablePositions {
            if position == to {
                pieces[to] = piece
                result = true
                break
            }
        }
        return result
    }

    func score() -> Score {
        var black: Int = 0
        var white: Int = 0
        for (_, v) in pieces {
            if v.color == .black {
                black += v.value
            } else {
                white += v.value
            }
        }
        return Score(black: black, white: white)
    }

    func pick(_ position: Position) {
        guard let tileStatus = tilesStatus[position] else { return }
        switch tileStatus {
        case .normal:
            if let piece = pieces[position], piece.color == player.color {
                refreshTilesStatus()
                tilesStatus[position] = .picked
                let availablePositions = piece.availablePositions(from: position, on: pieces)
                availablePositions.forEach {
                    tilesStatus[$0] = .movable
                }
                pickedPosition = position
            }
        case .movable:
            move(to: position)
            refreshTilesStatus()
            pickedPosition = nil
            changeTurn()
        case .picked:
            break
        }
    }

    private func refreshTilesStatus() {
        allPositions.forEach {
            tilesStatus[$0] = .normal
        }
    }

    private func changeTurn() {
        switch player.color {
        case .black:
            player = whitePlayer
        case .white:
            player = blackPlayer
        }
    }
}
