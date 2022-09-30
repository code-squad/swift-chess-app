//
//  Empty.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/01.
//

struct Empty: BoardElementRepresentable {

    var asSymbol: BoardElementSymbol {
        return .empty
    }
}
