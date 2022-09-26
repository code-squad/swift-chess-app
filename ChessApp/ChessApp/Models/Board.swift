//
//  Board.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/26.
//

import Foundation

final class Board {

    static let matrixSize: Int = 8

    private(set) var scoreForBlack: Int = 0
    private(set) var scoreForWhite: Int = 0

    var matrix = [[Pawn?]](repeating: [Pawn?](repeating: nil, count: Board.matrixSize), count: Board.matrixSize)

    init() {
        reset()
    }


    func reset() {
        matrix = [[Pawn?]](repeating: [Pawn?](repeating: nil, count: Board.matrixSize), count: Board.matrixSize)

        let rowForBlack = 1
        matrix[rowForBlack] = (0..<Board.matrixSize).map { Pawn(postion: IndexPath(row: rowForBlack, section: $0), type: .black) }

        let rowForWhite = 6
        matrix[rowForWhite] = (0..<Board.matrixSize).map { Pawn(postion: IndexPath(row: rowForWhite, section: $0), type: .white) }
    }

    func canMove(current: IndexPath, to nextPosition: IndexPath) -> Bool {
        guard isValidIndex(indexPath: current),
              isValidIndex(indexPath: nextPosition),
              let pawn = matrix[current.section][current.row],
              pawn.canMove(postion: nextPosition) else { return false }
        return false
    }

    func move(current: IndexPath, to nextPosition: IndexPath) {
        guard canMove(current: current, to: nextPosition),
        let pawn = matrix[current.section][current.row] else { return }
        pawn.move(to: nextPosition)
    }

    func description() -> String {
        var columnDescription = (0..<Board.matrixSize).reduce(" ", { partialResult, value in
            guard let column = UnicodeScalar(value + 65)  else { return partialResult }
            return partialResult.appending(String(column))
        })
        columnDescription.append(contentsOf: "\n")
        var totalString = columnDescription
        matrix.enumerated().forEach { (index, row)  in
            var rowString = "\(index + 1)"
            row.forEach { piece in
                guard let piece = piece else {
                    rowString.append(contentsOf: ".")
                    return }
                rowString.append(contentsOf: piece.iconString)
            }
            totalString.append(contentsOf: rowString)
            totalString.append(contentsOf: "\n")
        }
        totalString.append(columnDescription)
        return totalString
    }

    private func isValidIndex(indexPath: IndexPath) -> Bool {
        guard (0..<Board.matrixSize).contains(indexPath.row),
              (0..<Board.matrixSize).contains(indexPath.section) else { return false }
        return true
    }
}

extension Board: PawnDelegate {
    func didMovePawn(_ pawn: Pawn, position: IndexPath) {
        matrix[position.section][position.row] = pawn
    }
}
