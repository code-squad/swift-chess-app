//
//  BoardPresenter.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class BoardPresenter: BoardViewable {
    
    func display(from pieces: [[Piece?]]) -> [String] {
        return initialized(pieces).map {
            $0.joined(separator: "")
        }
    }
    
    func decoratedDisplay(from pieces: [[Piece?]]) -> [String] {
        decorated(initialized(pieces)).map {
            $0.joined(separator: "")
        }
    }
}

private extension BoardPresenter {
    
    func initialized(_ pieces: [[Piece?]]) -> [[String]] {
        return pieces.map { row in
            row.map { piece in
                return piece == nil ? "." : (piece?.toIcon ?? ".")
            }
        }
    }
    
    func decorated(_ strings: [[String]]) -> [[String]] {
        var newStrings = [[String]]()
        let rowString = [" "] + File.allCases.map({ $0.toString })
        newStrings.append(rowString)
        (0..<strings.count).forEach { row in
            newStrings.append(["\(row + 1)"] + strings[row])
        }
        newStrings.append(rowString)
        return newStrings
    }
}
