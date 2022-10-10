//
//  Score.swift
//  Chess
//
//  Created by jaeyoung Yun on 2022/10/02.
//

import Foundation

struct Score {
    let point: UInt

    static func +(lhs: Score, rhs: Score) -> Score {
        return Score(point: lhs.point + rhs.point)
    }

    static func -(lhs: Score, rhs: Score) -> Score {
        return Score(point: max(lhs.point - rhs.point, 0))
    }
}
