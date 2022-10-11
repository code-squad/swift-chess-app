//
//  BoardViewable.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

protocol BoardViewable {
    
    func display(with infos: [[PieceInfo?]])
    
    func display(with infos: [[PieceInfo?]]) -> [String]
    
    func display(with infos: [UserInfo])
}

extension BoardViewable {
    
    func display(with infos: [[PieceInfo?]]) -> [String] {
        return initialized(infos).map {
            $0.joined(separator: "")
        }
    }
    
    func initialized(_ infos: [[PieceInfo?]]) -> [[String]] {
        return infos.map { row in
            row.map { info in
                return info == nil ? "." : (info?.toIcon ?? ".")
            }
        }
    }
}
