//
//  StrideThrough.swift
//  ChessGame
//
//  Created by Sunghyun Kim on 2022/10/10.
//

import Foundation

func stride(from start: Int, through end: Int) -> StrideThrough<Int> {
    let addingNumber = start < end ? 1 : -1
    return stride(from: start, through: end, by: addingNumber)
}
