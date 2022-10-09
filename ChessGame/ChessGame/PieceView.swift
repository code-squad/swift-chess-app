//
//  PieceView.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/09.
//

import SwiftUI

struct PieceView: View {
    var piece: ChessPiece
    var size: CGFloat
    var body: some View {
        Text("\(String(piece.symbol))")
            .font(.system(size: size * 0.5))
            .padding(size * 0.1)
            .background {
                Circle().foregroundColor(Color.white)
            }
    }
}

struct PieceItem_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(piece: PawnPiece(teamColor: .white), size: 50)
    }
}
