//
//  TileView.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/10/12.
//

import SwiftUI

struct TileView: View {
    private(set) var status: Board.TileStatus = .normal
    let isColored: Bool

    var body: some View {
        GeometryReader { geometry in
            let length = min(geometry.size.width, geometry.size.height)
            Rectangle()
                .foregroundColor(isColored ? .gray : .white)
                .frame(width: length, height: length)
        }
        .scaledToFit()
        .if(status == .movable) {
            $0.border(.orange, width: 4)
        }
        .if(status == .picked) {
            $0.border(.blue, width: 4)
        }
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(isColored: true)
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
