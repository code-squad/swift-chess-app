//
//  PieceItem.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/09.
//

import SwiftUI

struct PieceItem: View {
    var piece: ChessPiece
    var body: some View {
        Text("\(String(piece.symbol))")
    }
}

struct PieceItem_Previews: PreviewProvider {
    static var previews: some View {
        PieceItem(piece: PawnPiece(teamColor: .white))
    }
}
