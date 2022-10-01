//
//  Board.swift
//  ChessApp
//
//  Created by 최동규 on 2022/09/26.
//

import Foundation

enum BoardMoveError: LocalizedError {
    case emptyBlock(postion: Position)
    case myPieceExist(piece: Piece)

    var errorDescription: String {
        switch self {
        case .emptyBlock(let postion):
            return "There is no piece where to start position: \(postion)"
        case .myPieceExist(let piece):
            return "There is my piece where to end position: \(piece.iconString) \(piece.position)"
        }
    }
}


final class Board {

    private(set) var scoreForBlack: Int = 0 {
        didSet {
            print("흑색 점수: \(scoreForBlack)")
        }
    }
    private(set) var scoreForWhite: Int = 0
    {
        didSet {
            print("백색 점수: \(scoreForWhite)")
        }
    }

    private(set) var matrix: [[BlockState]] = [[]]

    enum BlockState {
        case exist(_ value: Piece)
        case empty
    }

    init() {
        reset()
    }


    func reset() {

        matrix = [[BlockState]](repeating: [BlockState](repeating: .empty, count: File.Config.size), count: Rank.Config.size)

        let sectionForBlack = 1
        matrix[sectionForBlack] = (0..<Rank.Config.size).map { row -> BlockState in
            guard let position = Position(rank: Rank(row), file: File(sectionForBlack)) else { return .empty }
            let pawn = Pawn(position: position, type: .black)
            return .exist(pawn)
        }


        let sectionForWhite = 6
        matrix[sectionForWhite] = (0..<Rank.Config.size).map { row -> BlockState in
            guard let position = Position(rank: Rank(row), file: File(sectionForWhite)) else { return .empty }
            let pawn = Pawn(position: position, type: .white)
            return .exist(pawn)
        }

        scoreForWhite = 0
        scoreForBlack = 0
        
    }


    func description() -> String {
        var columnDescription = (0..<(matrix.first?.count ?? 0))
            .compactMap { column in
                File(column)
            }
            .reduce(" ", { partialResult, file in
            return partialResult.appending(file.valueName)
        })

        columnDescription.append(contentsOf: "\n")
        var totalString = columnDescription
        matrix.enumerated().forEach { (index, row)  in
            var rowString = Rank(index)?.valueName ?? "?"
            row.forEach { state in
                switch state {
                case .exist(let piece):
                    rowString.append(contentsOf: piece.iconString)
                case .empty:
                    rowString.append(contentsOf: ".")
                }
            }
            totalString.append(contentsOf: rowString)
            totalString.append(contentsOf: "\n")
        }
        totalString.append(columnDescription)
        return totalString
    }
}

