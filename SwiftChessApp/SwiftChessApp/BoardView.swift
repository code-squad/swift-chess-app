//
//  BoardView.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/12.
//

import SwiftUI

struct BoardView: View {
    @StateObject var board: Board = .init()

    var body: some View {
        GeometryReader { geometry in
            let length = min(geometry.size.width, geometry.size.height)
            let tileWidth = length / CGFloat(Position.File.maxCoordinate)
            ForEach(board.allPositions) { position in
                ZStack {
                    TileView(
                        status: board.tilesStatus[position] ?? .normal,
                        isColored: (position.x.coordinate + position.y.coordinate).isMultiple(of: 2)
                    )
                    if let piece = board.pieces[position] {
                        Text(piece.symbol)
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                    }
                    Button {
                        board.pick(position)
                    } label: {
                        Text(" ")
                            .font(.system(size: 40))
                    }.frame(width: tileWidth, height: tileWidth)
                }
                .frame(width: tileWidth, height: tileWidth)
                .offset(
                    x: tileWidth * CGFloat(position.x.coordinate-1),
                    y: tileWidth * CGFloat(position.y.coordinate-1)
                )
            }
        }
        .scaledToFit()
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
