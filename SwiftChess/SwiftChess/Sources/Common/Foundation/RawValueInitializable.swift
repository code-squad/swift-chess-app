//
//  RawValueInitializable.swift
//  SwiftChess
//
//  Created by Geonhee on 2022/10/02.
//

protocol RawValueInitializable: RawRepresentable {
    init?(rawValue: RawValue)
}
