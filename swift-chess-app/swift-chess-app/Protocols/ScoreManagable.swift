//
//  ScoreManagable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/10.
//

import Foundation

protocol ScoreManagable {
    
    func caculateScore(list: [[PieceInfo?]], option: ScoreOptions) -> Int
}
