//
//  ChessBoardPresenter.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/09/25.
//

import Foundation

class ChessBoardPresenter: ChessBoardViewable {
    
    func display(from pieces: [[ChessPiece?]]) -> [String] {
        return initialized(pieces).map {
            $0.joined(separator: "")
        }
    }
    
    func decoratedDisplay(from pieces: [[ChessPiece?]]) -> [String] {
        decorated(initialized(pieces)).map {
            $0.joined(separator: "")
        }
    }
}

private extension ChessBoardPresenter {
    
    func initialized(_ pieces: [[ChessPiece?]]) -> [[String]] {
        return pieces.map { row in
            row.map { piece in
                return piece == nil ? "." : (piece?.toIcon ?? ".")
            }
        }
    }
    
    func decorated(_ strings: [[String]]) -> [[String]] {
        var newStrings = [[String]]()
        let rowString = [" "] + ChessFile.allCases.map({ $0.toString })
        newStrings.append(rowString)
        (0..<strings.count).forEach { row in
            newStrings.append(["\(row + 1)"] + strings[row])
        }
        newStrings.append(rowString)
        return newStrings
    }
}
