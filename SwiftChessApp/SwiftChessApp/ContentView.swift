//
//  ContentView.swift
//  SwiftChessApp
//
//  Created by taehyeon.lee on 2022/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BoardView()
            .padding(CGFloat(8))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
