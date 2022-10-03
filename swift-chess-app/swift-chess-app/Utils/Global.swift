//
//  Array+Extensions.swift
//  swift-chess-app
//
//  Created by Haeseok Lee on 2022/10/03.
//

import Foundation

func sum(_ array: [Tuple]) -> Tuple {
    return array.reduce(Tuple.empty) { $0 + $1 }
}
