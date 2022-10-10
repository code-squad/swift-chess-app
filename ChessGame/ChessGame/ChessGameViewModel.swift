//
//  ChessGameViewModel.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/10.
//

import Foundation

class ChessGameViewModel: ObservableObject {
    enum TapState {
        case showPositions
        case movePiece
        
        mutating func next() {
            switch self {
            case .showPositions:
                self = .movePiece
            case .movePiece:
                self = .showPositions
            }
        }
    }
    
    @Published private var game = ChessGame()
    
    private var tapState: TapState = .showPositions
    
    private var selectedPosition: Position?
    @Published private(set) var availablePositions: Set<Position> = []
    
    var board: ChessBoard { game.board }
    func score() -> (white: Int, black: Int) {
        return game.board.scoreSum()
    }
    
    func onTapPosition(_ position: Position) {
        switch tapState {
        case .showPositions:
            showPositions(for: position)
        case .movePiece:
            movePiece(to: position)
        }
    }
    
    private func showPositions(for selectedPosition: Position) {
        availablePositions = game.availableMovingPositions(at: selectedPosition)
        guard !availablePositions.isEmpty else { return }
        self.selectedPosition = selectedPosition
        tapState.next()
    }
    
    private func movePiece(to destination: Position) {
        guard let selectedPosition else { fatalError() }
        game.movePiece(from: selectedPosition, to: destination)
        availablePositions = []
        self.selectedPosition = nil
        tapState.next()
    }
}
