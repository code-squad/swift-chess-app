//
//  BoardCLIView.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/10.
//

import Foundation

struct BoardCLIView: BoardViewable {
    
    func display(with infos: [[PieceInfo?]]) {}
    
    func display(with infos: [UserInfo]) {}
    
    func display(with infos: [[PieceInfo?]]) -> [String] {
        initialized(infos).map {
            $0.joined(separator: "")
        }
    }
}
