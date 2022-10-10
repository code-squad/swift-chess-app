//
//  ChessGameView.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/10.
//

import SwiftUI

struct ChessGameView: View {
    @ObservedObject var viewModel = ChessGameViewModel()
    
    var body: some View {
        BoardView(board: viewModel.board) { position in
            viewModel.onTapPosition(position)
        } extraFloorContent: { position in
            ZStack {
                if viewModel.availablePositions.contains(position) {
                    Color.red.opacity(0.5)
                }
                Text(position.description)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ChessGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChessGameView()
    }
}
