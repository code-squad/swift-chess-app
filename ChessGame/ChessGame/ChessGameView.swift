//
//  ChessGameView.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/10.
//

import SwiftUI

struct ChessGameView: View {
    @ObservedObject var game: ChessGame = ChessGame()
    
    @State private var selectedPosition: Position?
    @State private var availablePositions: Set<Position> = []
    
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
    @State private var tapState: TapState = .showPositions
    
    var body: some View {
        BoardView(board: game.board) { position in
            onTapPosition(position)
        } extraFloorContent: { position in
            if availablePositions.contains(position) {
                Color.red.opacity(0.5)
            }
        }
    }
    
    func onTapPosition(_ position: Position) {
        switch tapState {
        case .showPositions:
            showPositions(for: position)
        case .movePiece:
            movePiece(to: position)
        }
        tapState.next()
    }
    
    private func showPositions(for selectedPosition: Position) {
        self.selectedPosition = selectedPosition
        availablePositions = game.board.availableMovingPositions(at: selectedPosition)
    }
    
    private func movePiece(to destination: Position) {
        guard let selectedPosition else { fatalError() }
        game.movePiece(from: selectedPosition, to: destination)
        availablePositions = []
        self.selectedPosition = nil
    }
}

struct ChessGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChessGameView()
    }
}
