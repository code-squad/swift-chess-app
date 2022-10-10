//
//  BoardView.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/09.
//

import SwiftUI

struct BoardView<FloorContent: View>: View {
    var board: ChessBoard
    
    var onTapPosition: ((Position) -> Void)?
    
    var extraFloorContent: ((Position) -> FloorContent)?
    
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
                            Color.blackFloor
                        } else {
                            Color.whiteFloor
                        }
                    }
                    .aspectRatio(1, contentMode: .fill)
                    .overlay {
                        GeometryReader { geometry in
                            if let piece = board[position] {
                                PieceView(piece: piece, size: geometry.size.height)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    }
                    .overlay {
                        extraFloorContent?(position)
                    }
                    .onTapGesture {
                        onTapPosition?(position)
                    }
                }
            }
        }
    }
}

extension BoardView {
    init(board: ChessBoard,
         onTapPosition: ((Position) -> Void)? = nil,
         @ViewBuilder extraFloorContent: @escaping (Position) -> FloorContent
    ) {
        self.board = board
        self.onTapPosition = onTapPosition
        self.extraFloorContent = extraFloorContent
    }
}

private extension Position {
    var isBlackFloor: Bool {
        return (file + rank) % 2 == 0
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: .standardChessBoard()) { position in
            print(position)
        } extraFloorContent: { position in
            Text(position.description)
        }
    }
}
