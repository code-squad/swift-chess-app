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
        VStack {
            Text("백 \(viewModel.score().white)점")
            Text("흑 \(viewModel.score().black)점")
            BoardView(board: viewModel.board) { position in
                viewModel.onTapPosition(position)
            } extraFloorContent: { position in
                if viewModel.availablePositions.contains(position) {
                    Color.red.opacity(0.5)
                }
            }
            .padding(20)
            .overlay(alignment: .top) {
                fileRow()
                    .padding(.horizontal, 20)
            }
            .overlay(alignment: .leading) {
                rankColumn()
                    .padding(.vertical, 20)
            }
        }
    }
    
    private func fileRow() -> some View {
        HStack(spacing: 0) {
            ForEach("ABCDEFGH".map { String($0) }, id: \.self) { file in
                Text(file)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func rankColumn() -> some View {
        VStack(spacing: 0) {
            ForEach(Array(1...8).reversed(), id: \.self) { rank in
                Text("\(rank)")
                    .frame(maxHeight: .infinity)
            }
        }
    }
}

struct ChessGameView_Previews: PreviewProvider {
    static var previews: some View {
        ChessGameView()
    }
}
