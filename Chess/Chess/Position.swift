//
//  Position.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/09/26.
//

import Foundation

struct Position {
    let file: File
    let rank: Rank

    var right: Position? {
        guard let rightFile = file.right else { return nil }

        return Position(file: rightFile, rank: rank)
    }

    var left: Position? {
        guard let leftFile = file.left else { return nil }

        return Position(file: leftFile, rank: rank)
    }

    var top: Position? {
        guard let topRank = rank.top else { return nil }

        return Position(file: file, rank: topRank)
    }

    var bottom: Position? {
        guard let bottomRank = rank.bottom else { return nil }

        return Position(file: file, rank: bottomRank)
    }

    var topRight: Position? {
        guard let topRank = rank.top,
              let rightFile = file.right
        else {
            return nil
        }

        return Position(file: rightFile, rank: topRank)
    }
}

extension Position: Equatable {}
