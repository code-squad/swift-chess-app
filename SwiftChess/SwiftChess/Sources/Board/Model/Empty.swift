//
//  Empty.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/01.
//

/// 체스판의 특정 위치에 체스말이 놓여있지 않은 빈 상태를 나타내는 타입.
struct Empty: BoardElementRepresentable {

    var asSymbol: BoardElementSymbol {
        return .empty
    }
}
