//
//  ContentView.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/09/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: ChessGame = ChessGame()
    
    @State var availablePositions: Set<Position> = []
    
    var body: some View {
        BoardView(board: game.board) { position in
            availablePositions = game.board.availableMovingPositions(at: position)
        } extraFloorContent: { position in
            if availablePositions.contains(position) {
                Color.red.opacity(0.5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
