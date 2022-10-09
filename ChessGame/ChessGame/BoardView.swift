//
//  BoardView.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/09.
//

import SwiftUI

struct BoardView: View {
    var board: ChessBoard
    
    private var columns: [GridItem] {
        [GridItem](repeating: GridItem(spacing: 0), count: board.filesCount)
    }
    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            let ranks = Array(stride(from: board.ranksCount - 1, through: 0, by: -1))
            ForEach(ranks, id: \.self) { rank in
                ForEach(0..<board.filesCount, id: \.self) { file in
                    let position = Position(file: file, rank: rank)
                    Group {
                        if position.isBlackFloor {
                            Color.black
                        } else {
                            Color.white
                        }
                    }
                    .aspectRatio(1, contentMode: .fill)
                }
            }
        }
    }
}

extension Position {
    var isBlackFloor: Bool {
        return (file + rank) % 2 == 0
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: .standardChessBoard())
    }
}
