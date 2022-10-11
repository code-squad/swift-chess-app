//
//  ScoreManager.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

struct ScoreManager: ScoreManagable {
    
    func caculateScore(list: [[PieceInfo?]], option: ScoreOptions) -> Int {
        
        let infos = list.flatMap { $0 }.compactMap { $0 }
        var candidates = [PieceInfo]()
        
        if option.contains(.white) {
            candidates.append(contentsOf: infos.filter({ $0.color == .white }))
        }
        
        if option.contains(.black) {
            candidates.append(contentsOf: infos.filter({ $0.color == .black }))
        }
        
        return candidates.reduce(0) { $0 + $1.toScore }
    }
}
